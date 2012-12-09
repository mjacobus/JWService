JWService::Application.routes.draw do
  
  root to: "schedule#index"
  
  resources :buildings do
    resources :apartments
  end

  resources :territories
  
  get "schedule" => "schedule#index"
end
