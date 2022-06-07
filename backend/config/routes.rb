Rails.application.routes.draw do
    namespace :admin do
    resource :members
  end
end
