Rails.application.routes.draw do

  resources  :members

  devise_for :members

  mount Merged::Engine => "/merged"

  get ":id" , to: "merged/view#view" , id: :id
  root "merged/view#view" , id: 'index'
end
