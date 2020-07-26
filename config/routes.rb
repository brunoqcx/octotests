Rails.application.routes.draw do
  constraints format: :json do
    resources :events, only: [:create]
  end
end
