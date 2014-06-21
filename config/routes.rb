PlataformaInovatech::Application.routes.draw do
  resources :projects
  devise_for :users
  get "welcome/home"
  get "welcome/about"
  root 'welcome#home'
end
