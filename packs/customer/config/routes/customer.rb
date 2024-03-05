# frozen_string_literal: true

config = Rails.application.config.baukis2

constraints host: config[:customer][:host] do
  namespace :customer, path: config[:customer][:path] do
    root 'top#index'
  end
end
