FactoryBot.define do
  factory :book_table do
    date { rand(1..100).days.from_now }
    time { "20:30 " }
    heads { 5 }
    restaurant_id { 1 }
    user_id { 1 }
  end
end
