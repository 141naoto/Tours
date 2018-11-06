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

  resources :users, only:[:index, :show, :edit, :updae, :destroy]

  resources :regions, only:[:show] do
  	resources :prefectures, only:[:show] do
  		resources :places do
  			resource :goes, only:[:create, :destroy]
  			resources :comments, only:[:new, :show, :create, :destroy] do
  				resource :likes, only:[:create, :destroy]
  			end
  		end
  	end
  end

  post '/went_prefecture' => 'wents#went_prefecture'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
