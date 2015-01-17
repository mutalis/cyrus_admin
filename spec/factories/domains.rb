FactoryGirl.define do
  factory :domain do
    name {Faker::Internet.domain_name}
    quota {(rand*1000).to_i}
  end
end
