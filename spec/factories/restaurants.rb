FactoryBot.define do
  factory :restaurant do
    restaurant_name { "any store" }
    email { "any@gmail,com" }
    address { "unknown address" }
    phone_no { "9852123456" }
    table_price { 500.0 }
    restaurant_category_id { 1 }
    restaurant_category { create(:restaurant_category) } 
  end
end
