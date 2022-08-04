
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "articles#index"


  resources :articles do
    resources :comments
  end
  resources :users do
    resources :articles
  end
  resources :article do
    resources :likes, only: [:create, :destroy]
  end
end




