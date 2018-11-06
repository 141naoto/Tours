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
  end
  scope module: :public do
    resources :users, only:[:show, :edit, :update, :destroy]
  end

  resources :regions, only:[:show]

  resources :prefectures, only:[:show]

  namespace :admin do
    resources :places
  end
  scope module: :public do
    resources :places, only:[:show] do
      resource :goes, only:[:create, :destroy]
    		resources :comments, only:[:new, :show, :create, :destroy] do
    			resource :likes, only:[:create, :destroy]
      end
    end
  end

  post '/went_prefecture' => 'wents#went_prefecture'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
