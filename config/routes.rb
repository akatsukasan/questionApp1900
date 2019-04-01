Rails.application.routes.draw do
  get 'answers/edit'
  # get 'question/index'
  # get 'question/show'
  # get 'question/new'
  # get 'question/edit'

  # ルートメソッドの設定 最初の画面で質問一覧ページを表示する
  root 'questions#index'
  # ルーティングを自動的に用意してくれるメソッド(resources)
  resources :questions do
    resources :answers
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
