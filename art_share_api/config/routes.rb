Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :artworks, only: [:create, :destroy, :show, :update]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  
  resources :users do
    resources :artworks, only: [:index]
  end

  resources :users do
    resources :comments, only: [:index]
  end
  resources :artworks do
    resources :comments, only: [:index]
  end
end
