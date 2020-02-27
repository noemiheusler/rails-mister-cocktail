Rails.application.routes.draw do
  get 'doses/index'
  get 'doses/show'
  get 'doses/new'
  get 'doses/create'
  get 'doses/destroy'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:index, :new, :create]
  end
  resources :doses, only: [:show, :destroy]
end
