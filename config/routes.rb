Rails.application.routes.draw do
<<<<<<< Updated upstream
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
=======
  devise_for :users

  root to: "stocks#index"

  resources :users, only: [:show, :edit, :update]
  resources :stocks do

    member do
      patch :archive
      patch :unarchive
    end
    collection do
      get :history
    end

    resources :memos, only: [:create, :destroy]
    member do
      post 'add_image'
      delete 'remove_image'
    end
    
  end
end
>>>>>>> Stashed changes
