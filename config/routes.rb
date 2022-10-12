Rails.application.routes.draw do

  resources :channels
  resources :discussions do
    resources :replies
  end

  root 'discussions#index'

  devise_for :users, controllers: { registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
