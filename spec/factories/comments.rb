FactoryBot.define do
  factory :comment do
    body { "MyText" }
    ticket { nil }
    user { nil }
  end
end
