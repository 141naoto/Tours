class Public::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only:[:edit, :update]

    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to user_path(current_user.id)
      end
  end
  def new
    @record_new = Record.new
    @spot = @record_new.spots.build
  end

  def create
    @record_new = Record.new(record_params)
    @record_new.user_id = current_user.id
    if @record_new.save
      @spots = @record_new.spots
      @spots.each do |s|
        place = Place.find_by(place_name: s.spot_name)
        if place.nil?
          @new_place = Place.new
          @new_place.place_name = s.spot_name
          @new_place.prefecture_id = s.prefecture_id
          @new_place.show_count = 0
          @new_place.place_flag = true
          @new_place.save
        end
      end
       redirect_to user_path(current_user), success: '旅の記録を投稿しました。'
    else
      redirect_to new_record_path, danger: '旅の記録を投稿できませんでした。'
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def user_records
    @user = User.find(params[:user_id])
  end

  def index
    @records = Record.all
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to user_path(current_user)
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    @record.update
    redirect_to user_path(current_user)
  end

  private
  def record_params
    params.require(:record).permit(:record_title, :record_text, :user_id, spots_attributes: [:id, :prefecture_id, :spot_image, :spot_name, :spot_title, :_destroy] )
  end

end