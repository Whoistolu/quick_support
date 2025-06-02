FactoryBot.define do
  factory :ticket do
    subject { "MyString" }
    description { "MyText" }
    status { "MyString" }
    user { nil }
  end
end
