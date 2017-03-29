Rails.application.routes.draw do
	

  get 'analysis/index'
  get 'analysis/select'
  get 'analysis/calculate'

  	resources :groups do
  		get 'addnew' => 'groups#addnew'
  		post 'addcreate' => 'groups#addcreate'
  	end
	get 'auswertung' => 'events#indexwrong'
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