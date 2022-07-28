Rails.application.routes.draw do
  get '/', to: 'admin#initial_page'
  get '/admin', to: 'admin#initial_page'
  namespace :admin do
    get '/login', to: 'login#index'
    post '/login', to: 'login#login'
    delete '/logout', to: 'login#logout'
    resources :admin_members, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
    resources :members, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
  end
  get '/*not_found', to: 'routes#routing_error'
  post '/*not_found', to: 'routes#routing_error'
end
