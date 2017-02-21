Rails.application.routes.draw do

  resources :resumes

  resources :events do 
  	member do
  		get 'import'
  	end
  end
  root "marksmen#index"
  resources :marksmen
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
