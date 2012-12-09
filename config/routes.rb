JWService::Application.routes.draw do
  root to: "buildings#index"
  
  resources :buildings do
    resources :apartments
  end

  resources :territories
end
