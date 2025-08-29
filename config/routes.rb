Rails.application.routes.draw do
  get "likes/create"
  get "likes/destroy"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
   registrations: "users/registrations",
   sessions:       "users/sessions",
   passwords: "users/passwords",
   omniauth_callbacks: 'users/omniauth_callbacks'
   }

  root "homes#index"
  get "how_to_use", to: "homes#how_to_use"

  devise_scope :user do
    delete "logout", to: "users/sessions#destroy", as: :logout
  end

  resources :posts, only: %i[index new create show edit update destroy] do
    resource :likes, only: %i[create destroy index]
  end
  resources :likes, only: [ :index ]

  resources :marches, only: %i[index new create show edit update destroy] do
    resources :join_marches, only: [ :index, :update ], controller: "marches/join_marches"
    member do
      get :participants_info
      get :participants_info_edit
      patch :participants_info_update
    end
    collection do
      get :bookmarks  # /marches/bookmarks
    end
    resources :bookmarks, only: [ :create, :destroy ]
  end

  resource :mypage, only: [ :show, :edit, :update ]

  namespace :mypage do
    resources :join_marches, only: [ :create, :index, :destroy ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # Defines the root path route ("/")
  # root "posts#index"
end
