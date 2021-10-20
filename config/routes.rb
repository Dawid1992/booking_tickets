# frozen_string_literal: true

Rails.application.routes.draw do
  scope defaults: { format: 'json' } do
    resources :events do
      member do
        get "book/:amount", to: "events#book"
      end
    end
    resources :orders do
      member do
        get "tickets"
        post "pay/:token", to: "orders#pay"
      end
    end
  end
end
