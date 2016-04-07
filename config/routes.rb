Ecm::Tags::Engine.routes.draw do
  resources :tag_searchs, only: [:new, :create] do
    get '/', on: :collection, to: "tag_searchs#create"
  end

  root to: 'tag_searchs#new'
end
