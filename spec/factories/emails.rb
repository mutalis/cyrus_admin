FactoryGirl.define do
  factory :email do
    username { Faker::Internet.user_name }
    quota {(rand*10+1).to_i}
    password {Faker::Internet.password(8)}
    domain
  end
end
