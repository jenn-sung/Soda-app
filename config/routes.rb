Rails.application.routes.draw do
  
  namespace :v1 do
    
    get '/sodas' => 'sodas#index'
    get '/sodas/:id' => 'sodas#show'
    post '/sodas' => 'sodas#create'
    patch '/sodas/:id' => 'sodas#update'
  end
end
