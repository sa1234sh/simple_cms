Rails.application.routes.draw do
  
 


  root :to => 'public#index'

  get 'show/:parmalink' , :to => 'public#show'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'


 resources :admin_users , :except => [:show] do

  member do
    get :delete
  end
end

 resources :subjects do

  member do
    get :delete
  end

end 


resources :pages do
  member do
    get :delete
  end
end

resources :sections do
  member do
    get :delete
  end
end


#root 'testcontroller#exam'

  get 'testcontroller/exam'




  get 'demo/index'
  get 'demo/test'
  get 'demo/other_hello'
  get 'demo/escape_output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
