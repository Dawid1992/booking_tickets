# frozen_string_literal: true

Rails.application.routes.draw do
  scope defaults: { format: 'json' } do
    resources :events do
      get "book/:amount", to: "events#book"
        resources :orders do
          get "pay/:token", to: "orders#pay"
          resources :tickets
        end
      end
  end
end
