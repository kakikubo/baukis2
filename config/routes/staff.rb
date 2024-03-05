# frozen_string_literal: true

config = Rails.application.config.baukis2
namespace :staff, path: config[:staff][:path] do
  root 'top#index'
  get 'login' => 'sessions#new', as: :login
  resource :session, only: %i[create destroy]
  resource :account, except: %i[new create destroy]
  resource :password, only: %i[show edit update]
  resources :customers
end
