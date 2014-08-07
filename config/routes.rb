PlataformaInovatech::Application.routes.draw do

  resources :projects

  devise_for :users, controllers: { registrations: "users/registrations" }
  
  get "welcome/about"
  root 'welcome#home'
  
end
