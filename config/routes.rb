PlataformaInovatech::Application.routes.draw do

  resources :projects

  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: "omniauth_callbacks" }
  
  get "welcome/about"
  root 'welcome#home'
  
end
