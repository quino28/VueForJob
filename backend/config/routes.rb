Rails.application.routes.draw do
  namespace :admin do
    get 'login', to: 'login#index'
    post 'login', to: 'login#login'
    resources :members, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
  end
end
