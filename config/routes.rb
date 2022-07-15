Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'users#index'
  scope 'api/v1' do
    devise_for :users, controllers: {
      sessions: 'api/v1/sessions',
      passwords: 'api/v1/passwords',
      registrations: 'api/v1/registrations',
      confirmations: 'api/v1/confirmations'
    }, defaults: { format: :json }
  end
end
