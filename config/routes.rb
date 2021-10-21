# frozen_string_literal: true

# Rails.application.routes.draw do
#   scope defaults: { format: 'json' } do
#     resources :events do
#       post :book
#         resources :orders do
#           post :pay
#         end
#       end
#   end
# end

Rails.application.routes.draw do
  resources :events, defaults: { format: :json } do
    member do
      get :tickets
      post :book
      resources :orders do
        post :pay
      end
    end
  end
end
