FactoryBot.define do
  factory :food_item do
    name { "any fooditem" }
    price { 100 }
    restaurant_id { 1 }
  end  
end
