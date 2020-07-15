Rails.application.routes.draw do
	devise_for :users
	root 'home#top'
  	get 'home/about'
  	resources :users,only: [:show,:index,:edit,:update] do
  		resource :relationships, only: [:create, :destroy]
  		get "follows" => "relationships#follower", as: "follows"
  		get "follower" => "relationships#followed", as: "followers"
  	end
  	resources :books do
  		resource :favorites, only: [:create, :destroy]
  		resource :book_comments, only: [:create, :destroy]
  	end
  	
end
