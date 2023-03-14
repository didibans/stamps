Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/:user_id/stamp_cards", to: "stamp_cards#stampit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :pages, only: [:show]
  resources :shops do
    resources :stamp_card_templates, only: %i[new create] do
      resources :stamp_cards, only: %i[create update]
    end
  end
end
