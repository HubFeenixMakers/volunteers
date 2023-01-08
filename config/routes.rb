Rails.application.routes.draw do

  devise_for :members

  resources  :members

  mount Thredded::Engine => '/forum'

  mount Merged::Engine => "/merged"

  get ":id" , to: "merged/view#page" , id: :id
  root "merged/view#page" , id: 'index'
end
