ActionController::Routing::Routes.draw do |map|
  
  map.root :controller=>"pages",:action=>"home"
  map.resources :users
  map.resources :notes
  map.resources :sessions
  map.resources :joinings
  map.logout 'logout', :controller=>"sessions",:action=>"destroy"
  map.create_session '/create_session', :controller=>"sessions",:action=>"create"
  map.create_connection '/connect',:controller=>"joinings",:action=>"create"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
