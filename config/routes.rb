Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts, only: %i[index create update destroy], shallow: true do
    resources :comments, only: %i[create]
    resources :post_likes, only: %i[create destroy]
  end
  resources :comments, only: %i[update destroy], shallow: true do
    resources :comment_likes, only: %i[create destroy]
  end
  resources :children, only: %i[create destroy], shallow: true do
    resources :filiations, only: %i[create update]
  end
  resources :users, only: %i[show]
end
