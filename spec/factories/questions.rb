FactoryBot.define do
  factory :question do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:title) { |n| "TEST#{n}TITLE"}
    sequence(:content) { |n| "TEST_CONTE#{n}"}
  end
  factory :invalid_question, class: Question do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:title) { |n| "TEST#{n}TITLE"}
    sequence(:content) { |n| "TEST_CONTE#{n}"}
  end
end
