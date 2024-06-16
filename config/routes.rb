Rails.application.routes.draw do

  devise_for :users

  root to: "stocks#index"

  resources :users, only: [:show, :edit, :update]
  resources :stocks do

    member do
      patch :archive
      patch :unarchive
      post :add_image
      delete :remove_image
      # post :add_pdf
      # delete :remove_pdf
    end

    collection do
      get :history
    end

    resources :memos, only: [:create, :destroy]
    
  end
end