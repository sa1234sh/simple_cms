Rails.application.routes.draw do
  
 

 

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
