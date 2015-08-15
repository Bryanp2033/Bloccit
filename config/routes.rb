Rails.application.routes.draw do

  devise_for :users

  resources :posts
  resources :advertisements, only: [:index, :show]
  resources :question

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'
  
  get "welcome/faq"

  
  root to: 'welcome#index'
end
