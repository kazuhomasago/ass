Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  #root 'xxxx#yyyyy'

  #resources :xxxxxx, only: [] do
  #  root 'xxxx#yyyyy'

  #  collection do
  #    get :xxx
  #    post :xxx
  #  end
  #  member do
  #    get :xxx
  #    post :xxx
  #  end
  #end
end
