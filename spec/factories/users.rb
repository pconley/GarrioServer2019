FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "bot#{1000+n}@factory.com"
    end
    name { Faker::Name.name }
    password { "password" }

    # admin is a user with the flag set and we also
    # give the test admin a different password
    factory :admin do
      admin { true }
      password  {"administrator"}
    end
    
  end
end
