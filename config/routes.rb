Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        resource :user, only: [:create]
      end
      namespace :candidates do
        resources :candidates, only: [:create, :index]
      end
      namespace :votes do
        resources :votes, only: [:create]
      end
    end
  end
end
