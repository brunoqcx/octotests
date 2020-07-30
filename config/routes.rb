Rails.application.routes.draw do
  constraints format: :json do
    resources :events, only: [:create]

    get '/issues/:issue_number/events',  to: 'issue_events#index'
  end
end
