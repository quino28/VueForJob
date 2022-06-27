Rails.application.routes.draw do
  namespace :admin do
    get '/login', to: 'login#index'
    post '/login', to: 'login#login'
    delete '/logout', to: 'login#logout'
    resources :members, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
  end
end
