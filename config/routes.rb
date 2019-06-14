Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users
  get 'visitor_actions/sign_in'
  get 'visitor_actions/sign_out'
  root 'home#index'
  resources :projects do
    resources :project_items
  end
  namespace :api do
    resources :projects, only: [:index, :update]
  end


end
