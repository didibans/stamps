Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'pages/rqcode', to: 'pages#qr_code_show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :shops do
    resources :stamp_card_templates, only: %i[new create] do
      resources :stamp_cards, only: %i[new create]
    end
  end
end
