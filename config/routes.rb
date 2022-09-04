Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :departures, except: :show do
    collection do
      post '/destroy_all', to: 'departures#destroy_all'
    end
  end
  resources :departure_warnings do
    collection do
      post '/destroy_all', to: 'departure_warnings#destroy_all'
    end
  end
  resources :calculators
  resources :importers
  get '/departure_warnings_report', to:'departure_warnings#report'
end
