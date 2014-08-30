Reddit::Application.routes.draw do
  resources :users
  resource :session
  resources :subs
  resources :subs, only: [:show] do
    resources :posts, only: [:new, :create, :edit, :update]
  end

  resources :posts
end
