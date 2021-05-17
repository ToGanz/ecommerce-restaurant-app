Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :products
  resources :line_items, only: [:create, :update, :destroy]
  resources :orders, only: [:index, :show, :edit, :update, :destroy]

  resource :checkout

  root 'pages#home'
  get 'info', to: 'pages#info'
  get 'admin', to: 'pages#admin_section'
  get 'menu', to: 'menu#index'
  get 'search', to: 'menu#search'
  get 'cart', to: 'cart#show'


  scope '/payment' do
    post 'create', to: 'payment#create', as: 'payment_create'
    get 'cancel', to: 'payment#cancel', as: 'payment_cancel'
    get 'success',  to: 'payment#success', as: 'payment_success'
  end
 


  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
