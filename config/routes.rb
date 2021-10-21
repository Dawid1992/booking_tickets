# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events, defaults: { format: :json } do
    member do
      post :book
      resources :orders do
        post :pay
      end
    end
  end
end
