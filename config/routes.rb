# frozen_string_literal: true

Rails.application.routes.draw do
  scope defaults: { format: 'json' } do
    resources :events do
      get "book/:amount", to: "events#book"
        resources :orders do
          member do
            get "tickets"
            get "pay/:token", to: "orders#pay"
          end
    end
    
    end
  end
end
