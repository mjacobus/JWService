JWService::Application.routes.draw do
  resources :buildings do
    resources :apartments
  end

  resources :territories
end
