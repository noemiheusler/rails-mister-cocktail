Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:index, :new, :create]
  end
  resources :doses, only: [:show, :destroy]
end
