Rails.application.routes.draw do
  namespace :staff do
    root "top#index"
    get "login" => "session#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end

  namespace :admin do
    root "top#index"
    get "login" => "session#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end

  namespace :customer do
    root "top#index"
  end
end
