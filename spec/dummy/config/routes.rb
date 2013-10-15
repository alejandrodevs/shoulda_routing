Dummy::Application.routes.draw do
  resources :users
  resources :comments, :likes

  resources :posts do
    resources :comments, :likes
  end
end
