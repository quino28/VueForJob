Rails.application.routes.draw do
  get '/', to: 'admin#index'
  get '/admin', to: 'admin#index'
  namespace :admin do
    get '/login', to: 'login#index'
    post '/login', to: 'login#login'
    delete '/logout', to: 'login#logout'
    resources :admin_members, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
  end
end
