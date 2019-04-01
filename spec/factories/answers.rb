FactoryBot.define do
  factory :answer do
    association :question
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:content) { |n| "TEST_CONTE#{n}"}
  end
end
