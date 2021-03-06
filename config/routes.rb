Rails.application.routes.draw do
  resources :posts do
    collection do
      post :confirm
    end
  end
  get 'posts/index'
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
