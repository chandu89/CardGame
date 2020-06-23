Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :games, only: [:create] do
        post :create_game, on: :collection
        get :get_card_by_game, on: :collection
      end
    end
  end
end
