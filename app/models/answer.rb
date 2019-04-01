class Answer < ApplicationRecord
  belongs_to :question

  # 回答入力フォームのバリデーションチェック(未入力チェック)
  validates :content, presence: true
  validates :name, presence: true
end
