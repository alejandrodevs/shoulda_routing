Dummy::Application.routes.draw do

  resources :users do
    resources :posts do
      resources :comments do
        resources :likes
      end
    end
  end

  # root 'welcome#index'
end
