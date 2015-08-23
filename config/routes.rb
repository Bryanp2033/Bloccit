Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :advertisements, only: [:index, :show]
  resources :question

     resources :topics do
     resources :posts, except: [:index]
   end
 
   resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
   end

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'
  
  get "welcome/faq"

  
  root to: 'welcome#index'
end

