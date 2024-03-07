# frozen_string_literal: true

config = Rails.application.config.baukis2

constraints host: config[:admin][:host] do
  namespace :admin, path: config[:admin][:path] do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    resource :session, only: %i[create destroy]
    resources :staff_members do
      resources :staff_events, only: [:index]
    end
    resources :staff_events, only: [:index]
  end
end
