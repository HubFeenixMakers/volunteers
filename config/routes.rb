Rails.application.routes.draw do

  devise_for :members

  resources  :members

  mount Thredded::Engine => '/forum'

  mount Merged::Engine => "/merged"

  get ":id" , to: "merged/view#view" , id: :id
  root "merged/view#view" , id: 'index'
end
