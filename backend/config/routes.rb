Rails.application.routes.draw do
  scope module: 'api' do
    resources :index
  end
end
