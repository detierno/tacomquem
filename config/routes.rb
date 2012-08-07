Tacomquem::Application.routes.draw do
  resources :lends do
    resources :reminders
  end

  devise_for :users

  resources :friendships, only: [:index, :create, :destroy]

  root :to => 'lends#index'
end
