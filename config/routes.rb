Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#index'
      get 'backgrounds', to: 'images#show'
    end
  end
end
