Ecm::Tags::Engine.routes.draw do
  resources :tag_searchs, only: [:new, :create]

  root to: 'tag_searchs#new'
end
