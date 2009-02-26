ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :sessions
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
