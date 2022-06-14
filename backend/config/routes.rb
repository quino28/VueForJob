Rails.application.routes.draw do
  namespace :admin do
    resources :members, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
  end
end
