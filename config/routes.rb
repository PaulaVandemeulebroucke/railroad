Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get "dashboard", to: "pages#dashboard"
  resources :offers do
    resources :bookings, only: [:index, :create, :show, :destroy]
  end
  get "/bookings/:id/deny", to: "bookings#deny", as: :deny
  get "/bookings/:id/accept", to: "bookings#accept", as: :accept
  patch "offers/:id/like", to: "offers#like", as: :like
  patch "offers/:id/dislike", to: "offers#dislike", as: :dislike
end
