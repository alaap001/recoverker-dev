Rails.application.routes.draw do
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'
  resources  :users
  resources :colleges, only: [:index]

  get 'partners' , to: 'home#partners', as: :partners 
  get 'thankyou' , to: 'home#thankyou' , as: :thankyou
  get 'requests/payment/:id' , to: 'requests#payment', as: :payment

   resources :feedbacks , only: [:new,:create]
  resources :conversations, only: [:index, :show, :destroy]
   resources :requests
   namespace :passwordadmin do 
    resources :users, only: :show do 
      post :generate_new_password_email 
    end 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
