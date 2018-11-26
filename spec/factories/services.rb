FactoryBot.define do
  factory :service do
    user # creates a user!
    provider {"MyString"}
    uid {"MyString"}
    access_token {"MyString"}
    access_token_secret {"MyString"}
    refresh_token {"MyString"}
    expires_at {"2018-05-13 08:30:41"}
    auth {"MyText"}
  end
end
