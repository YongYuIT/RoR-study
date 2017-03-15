Rails.application.routes.draw do
  get 'chat/conn_test'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "chat#conn_test"
  
end
