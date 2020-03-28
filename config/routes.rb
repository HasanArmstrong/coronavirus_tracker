Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  post 'receive_coronvirus_info' => 'home#receive_webhooks'
end
