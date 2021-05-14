Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :products

  root 'pages#home'
  get 'info', to: 'pages#info'
  get 'admin', to: 'pages#admin_section'
  get 'menu', to: 'menu#index'
  get 'search', to: 'menu#search'
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
