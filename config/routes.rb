Rails.application.routes.draw do
  resources :stories

  devise_for :members

  resources  :members

  mount Thredded::Engine => '/forum'

  mount Merged::Engine => "/merged"

  get "/news/:id" , to: "merged/view#page" , id: :id , as: :view_blog
  get ":id" , to: "merged/view#page" , id: :id , as: :view_page

  root "merged/view#page" , id: 'index'
end
