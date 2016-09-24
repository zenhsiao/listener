Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :listeners
 
 namespace :admin do
 	resources :listeners
 end

end
