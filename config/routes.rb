Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
}, path_names: {
  sign_in: "login",
  sign_out: "logout"
} 
  root to: 'common_boards#index'
  resources :common_boards
  resources :boards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
