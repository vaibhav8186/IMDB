Rails.application.routes.draw do
  resources :items
	root 'movies#index'
  devise_for :users
	resources :movies
	resources :actors
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
	get 'addactormovie', to: 'movies#addactormovie'
	get 'allmovies', action: :allmovies, controller: 'movies'
	get 'not_added_movies', action: :not_added_movies ,controller: 'actors'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
