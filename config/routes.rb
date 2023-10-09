Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/photos" => "photos#index"
  get "/photos/:id" => "photos#show"
  post "/photos" => "photos#create"
  patch "/photos/:id" => "photos#update"
  delete "/photos/:id" => "photos#destroy"

  get "/paragraphs" => "paragraphs#index"
  get "/paragraphs/:id" => "paragraphs#show"
  post "/paragraphs" => "paragraphs#create"
  patch "/paragraphs/:id" => "paragraphs#update"
  delete "/paragraphs/:id" => "paragraphs#destroy"

  get "/posts" => "posts#index"
  get "/posts/:id" => "posts#show"
  post "/posts" => "posts#create"
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"
end
