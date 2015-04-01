# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  username   :string
#  quota      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  domain_id  :integer
#
# Indexes
#
#  index_emails_on_domain_id  (domain_id)
#  index_emails_on_username   (username) UNIQUE
#

FactoryGirl.define do
  factory :email do
    username { Faker::Internet.user_name + '@' + domain.name }
    quota {(rand*10+1).to_i}
    password {Faker::Internet.password(8)}
    domain
  end
end
