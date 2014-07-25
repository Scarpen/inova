PlataformaInovatech::Application.routes.draw do

  resources :projects do
    collection do
      get "for_approval"
    end
  end


  devise_for :users
  
  get "welcome/home"
  get "welcome/about"
  root 'welcome#home'
  
end
