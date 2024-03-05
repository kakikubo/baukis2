# frozen_string_literal: true

Rails.application.routes.draw do
  config = Rails.application.config.baukis2

  draw(:staff)
  draw(:admin)

  constraints host: config[:customer][:host] do
    namespace :customer, path: config[:customer][:path] do
      root 'top#index'
    end
  end
end
