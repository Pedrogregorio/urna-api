Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        resource :user, only: [:create]
      end
    end
  end
end
