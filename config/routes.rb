Rails.application.routes.draw do

  get 'downgrade/create'
  get 'downgrade/new'
  get 'charges/new'
  get 'charges/create'
  
  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end
  
  devise_for :users
  get 'about' => 'welcome#about'
  get 'welcome/about'
  
  resources :charges, only: [:new, :create]

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
