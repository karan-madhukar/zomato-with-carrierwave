FactoryBot.define do
  factory :user, class: User do
    Username { "person" }
    email   { "person@gmail.com" }
    password { "123456" }
  end

  factory :user2, class: User do
    Username { "person" }
    email   { "person2@gmail.com" }
    password { "123456" }
  end

  factory :user3, class: User do
    Username { "person" }
    email   { "person3@gmail.com" }
    password { "123456" }
  end

  factory :admin, class: User do
    Username { "person" }
    email   { "person4@gmail.com" }
    password { "123456" }
    admin { true }
  end
end
