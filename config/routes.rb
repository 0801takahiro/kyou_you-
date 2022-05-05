Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :impressions, only: [:show, :create] do
    resources :post_impressions, only: [:create, :destroy]
  end
  get "search_result" => "searches#search_result"
  get "search" => "searches#search"
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy',as: 'destroy_favorite'
  resources :tags, only: [:index,:show]
  root to: 'impressions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end