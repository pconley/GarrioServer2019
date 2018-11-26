FactoryBot.define do
  factory :admin, class: User do
    # r = Random.new(Time.now.to_i).rand(99999)
    sequence :email do |n|
      "admin#{2000+n}@factory.com"
    end
    password  {"administrator"}
  end
end
