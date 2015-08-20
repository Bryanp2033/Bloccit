Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :advertisements, only: [:index, :show]
  resources :question

  resources :topics do
  	resources :posts, expect:[:index]
  end
 

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'
  
  get "welcome/faq"

  
  root to: 'welcome#index'
end

