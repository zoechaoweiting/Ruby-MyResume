Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :resumes do
    collection do
      get :my
    end

    member do
      patch :pin
    end
  end
  # 上面這行等於下面八行
  # get "/resumes", to: "resumes#index"
  # get "/resumes/new", to: "resumes#new", as: "new_resume"
  # post "/resumes", to: "resumes#create"
  # get "/resumes/:id", to: "resumes#show", as: "resume"
  # delete "/resumes/:id", to: "resumes#destroy"
  # get "/resumes/:id/edit", to: "resumes#edit", as: "edit_resume"
  # patch "/resumes/:id", to: "resumes#update"
  # put "/resumes/:id", to: "resumes#update"
  
  resource :users, only: [:create] do
    get :sign_up
    get :sign_in
  end
  # 可以把下面這兩行包進去，因為sing_up是我們自定義的名字，所以是用個block包，而creat是本來resource就會產生的路徑之一，所以寫在上面
  # get "/users/sign_up", to: "users#new"
  # post "/users/", to: "users#create"

  resource :sessions, only: [:create, :destroy] do
  end
  # 其實要建立在users的resource也是可以

  get "/@:user_id", to: "users#default_resume"
  get "/@:user_i/:id", to: "resumes#show", as: "user_resume"

  root "resumes#index"
end
