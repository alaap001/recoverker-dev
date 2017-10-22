Rails.application.routes.draw do
  get 'colleges/index'

  get 'requests/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'
  resources  :users
  resources :colleges, only: [:index]

  get 'partners' , to: 'home#partners', as: :partners 
   resources :feedbacks , only: [:new,:create]
  resources :conversations, only: [:index, :show, :destroy]
   resources :requests , only: [:create,:new,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
