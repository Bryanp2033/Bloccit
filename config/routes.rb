Rails.application.routes.draw do

  get 'ad/index'

  get 'ad/show'

  resources :posts
  resources :advertisment

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'
  
  get "welcome/faq"

  
  root to: 'welcome#index'
end
