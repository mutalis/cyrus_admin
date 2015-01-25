FactoryGirl.define do
  factory :email do
    username {Faker::Internet.email}
    quota {(rand*1000).to_i}
    password {Faker::Internet.password(8)}
  end
end
