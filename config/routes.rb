Rails.application.routes.draw do
 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :listeners do 
 	collection do
 		get :list
 	end
 	member do
 		post :like
 	end
 end
 
 resources :users do
 	resources :orders
 end

 namespace :admin do
 	resources :listeners
 	resources :availabletimes
 end
 
 root to: "listeners#index"
end
