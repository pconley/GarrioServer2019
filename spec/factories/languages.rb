require 'faker'

def random_alpha_string(n)
  ('a'..'z').to_a.shuffle[0,n].join
end

FactoryBot.define do
  factory :language do
    name { random_alpha_string(8) }
    code { random_alpha_string(2) }
    # code { Faker::Address.state_abbr }
    image { nil }
  end
end
