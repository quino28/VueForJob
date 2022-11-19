Rails.application.routes.draw do
  # Admin routes
  get '/', to: 'admin#initial_page'
  get '/admin', to: 'admin#initial_page'
  namespace :admin do
    get '/login', to: 'login#index'
    post '/login', to: 'login#login'
    delete '/logout', to: 'login#logout'
    resources :admin_members, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
    resources :members, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
  end

  # Api routes
  namespace :api do
    post '/sign_in', to: 'sign_in#sign_in'
  end

  # Not found pages
  get '/*not_found', to: 'routes#routing_error'
  post '/*not_found', to: 'routes#routing_error'
end
