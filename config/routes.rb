Rails.application.routes.draw do
  resources :barang_keluars
  resources :barang_masuks
  resources :barangs
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :staffs, controllers: { sessions: 'staffs/sessions', registrations: 'staffs/registrations' }
  devise_scope :staff do
    get 'sign_in', to: 'devise/sessions#new'
    get '/staffs/sign_out' => 'devise/sessions#destroy'
  end
  resources :homes
  root to: 'homes#index'
end
