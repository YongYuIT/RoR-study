Rails.application.routes.draw do
  resources :leave_records
  resources :staffs
  get 'login_sys/login_pag'
  post 'login_sys/check_login'
  get 'leave_records/excel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'login_sys#login_pag'
end
