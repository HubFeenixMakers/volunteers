Rails.application.routes.draw do

  devise_for :members

  resources  :members


  mount Merged::Engine => "/merged"

  get ":id" , to: "merged/view#view" , id: :id
  root "merged/view#view" , id: 'index'
end
