FactoryBot.define do
  factory :announcement do
    published_at {"2018-05-13 08:30:37"}
    announcement_type {"new"} # see model for types
    name {"MyString"}
    description {"MyText"}
  end
end
