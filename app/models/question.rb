class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  # 質問入力フォームのバリデーション(未入力チェック)
  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
