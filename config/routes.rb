Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new", as: "new_resumes"

  root "pages#home"
end