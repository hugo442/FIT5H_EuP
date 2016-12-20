Rails.application.routes.draw do
	root 'events#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get "events" => "events#index"
  #get "events/:id" => "events#show"
  resources :events do
  	resources :registrations
  end
end