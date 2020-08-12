FactoryBot.define do
  factory :review do
    rating { 4 }
    feedback { "something" }
    restaurant_id { 1 }
    user_id { 1 }
    approve { false }
  end

  factory :review_approved do
    rating { 4 }
    feedback { "sometnig" }
    restaurant_id { 1 }
    user_id { 1 }
    approve { true }
  end
end
