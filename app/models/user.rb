class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :gos
  has_many :comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_one :went, dependent: :destroy

  after_create:create_went

  validates :user_introduction, length: {maximum:150}
  validates :name, length: { minimum: 2, maximum: 20 }

 private
  def create_went
  	went = Went.new(user_id: self.id, prefecture_count:0)
    went.save
  end
end
