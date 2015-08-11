Rails.application.routes.draw do

  devise_for :users
  get 'ad/index'

  get 'ad/show'

  resources :posts
  resources :advertisment
  resources :question

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'
  
  get "welcome/faq"

  
  root to: 'welcome#index'
end
