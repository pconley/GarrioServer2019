FactoryBot.define do
  factory :user do
    # r = Random.new(Time.now.to_i).rand(99999)
    sequence :email do |n|
      "bot#{1000+n}@factory.com"
    end
    password  "passwork"
  end
end
