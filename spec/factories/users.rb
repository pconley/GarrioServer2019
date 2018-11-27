FactoryBot.define do
  factory :user do
    # r = Random.new(Time.now.to_i).rand(99999)
    # addr = "bot#{r}@factory.com"
    # email { addr }
    sequence :email do |n|
      "bot#{1000+n}@factory.com"
    end
    password { "password" }

    # factory :admin do
    #   admin { true }
    #   password  {"administrator"}
    # end
    
  end
end
