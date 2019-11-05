Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
}, path_names: {
  sign_in: "login",
  sign_out: "logout"
} 
  root to: 'boards#index'
  get 'boards/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
