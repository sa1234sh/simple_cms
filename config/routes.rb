Rails.application.routes.draw do
  
#root 'testcontroller#exam'

  get 'testcontroller/exam'




  get 'demo/index'
  get 'demo/test'
  get 'demo/other_hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
