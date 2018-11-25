Rails.application.routes.draw do

  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
   sessions:      'users/sessions',
   passwords:     'users/passwords',
   registrations: 'users/registrations'
  }

  root to:'top#top'

  namespace :admin do
    resources :users, only:[:index, :show, :edit, :updae, :destroy]
    resources :records, only:[:index, :show, :edit, :update, :destroy]
    resources :spots, only:[:index, :show, :edit, :update, :destroy]
  end
  scope module: :public do
    resources :users, only:[:show, :edit, :update, :destroy] do
          get "/user_records" => "records#user_records"
    end
    resources :records
    get '/spot_place' => "spots#spot_place"
    resources :spots, only:[:show]
  end

  resources :regions, only:[:show]

  resources :prefectures, only:[:show]

  namespace :admin do
    resources :places
  end
  scope module: :public do
    resources :places, only:[:show] do
      resource :went_prefectures, only:[:create, :destroy]
      patch "/show_count" => "places#show_count",as: 'show_count'
      resource :goes, only:[:create, :destroy, :show]
      get '/comment_index' => "comments#comment_index"
    	resources :comments, only:[:new, :show, :create, :destroy] do
    		resource :likes, only:[:create, :destroy]
      end
    end
    resources :comments, only:[:show]
  end

  get "/search_index/places" => "top#search_index"

  get "/search" => "top#search"

  get "/goes" => "public/goes#goes_list"

  get '/post/hashtag/:name' => "public/comments#hashtag"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
