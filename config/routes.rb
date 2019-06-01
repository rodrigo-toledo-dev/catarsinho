Rails.application.routes.draw do
  devise_for :users
  get 'visitor_actions/sign_in'
  get 'visitor_actions/sign_out'
  root 'home#index'
  resources :projects do
    resources :project_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
