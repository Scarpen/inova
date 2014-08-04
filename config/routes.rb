PlataformaInovatech::Application.routes.draw do

  resources :projects do
    collection do
      get :for_approval
      put :approve, key: :id
    end
  end


  devise_for :users
  
  get "welcome/about"
  root 'welcome#home'
  
end
