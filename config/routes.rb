Rails.application.routes.draw do

  devise_for :user

  resources :users do
    resources :appointments
  end


  get 'welcome/index'

  root 'welcome#index', as: 'landing'

  authenticated :user do
    root "appointments#index", as: "authenticated_root"
  end
end
