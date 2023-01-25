Rails.application.routes.draw do
  resources :pictures
  resources :stories

  devise_for :members ,controllers: { registrations: 'registrations' }
  devise_scope :member do
    get "/members/edit_email" , to: "registrations#edit_email"
  end

  resources  :members

  mount Thredded::Engine => '/forum'

  mount Merged::Engine => "/merged" unless Rails.env.production?

  post "/form" , to: "merged/form#post" , as: :post_form
  get "/news/:id" , to: "merged/view#page" , id: :id , as: :view_blog
  get ":id" , to: "merged/view#page" , id: :id , as: :view_page

  root "merged/view#page" , id: 'index'
end
