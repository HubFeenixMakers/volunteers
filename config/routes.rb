Rails.application.routes.draw do
  resources :pictures
  resources :stories

  devise_for :members ,controllers: { registrations: 'registrations' }
  devise_scope :member do
    get "/members/edit_email" , to: "registrations#edit_email"
  end

  resources  :members

  mount Thredded::Engine => '/forum'

  merged_routes root: true

end
