Rails.application.routes.draw do
  
  resources :likes
	root 'events#index'

	get 'signup' => 'users#new'
	
	resource :session
	resources :users

  	resources :events do
  		resources :registrations
  	end
end