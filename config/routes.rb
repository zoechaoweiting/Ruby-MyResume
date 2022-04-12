Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :resumes
  # 上面這行等於下面八行
  # get "/resumes", to: "resumes#index"
  # get "/resumes/new", to: "resumes#new", as: "new_resume"
  # post "/resumes", to: "resumes#create"
  # get "/resumes/:id", to: "resumes#show", as: "resume"
  # delete "/resumes/:id", to: "resumes#destroy"
  # get "/resumes/:id/edit", to: "resumes#edit", as: "edit_resume"
  # patch "/resumes/:id", to: "resumes#update"
  # put "/resumes/:id", to: "resumes#update"

  root "resumes#index"
end
