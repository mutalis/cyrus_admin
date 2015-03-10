FactoryGirl.define do
   # domain factory without associated emails
  factory :domain do
    name {Faker::Internet.domain_name}
    quota {1000}

    # domain_with_posts will create email data after the domain has been created
    factory :domain_with_emails do
      # emails_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        emails_count 10
      end

      # the after(:create) yields two values; the domain instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the domain is associated properly to the email
      after(:create) do |domain, evaluator|
        create_list(:email, evaluator.emails_count, domain: domain)
      end
    end
  end
end

# This allows us to do:
# 
# create(:domain).posts.length # 0
# create(:domain_with_emails).posts.length # 10
# create(:domain_with_emails, posts_count: 15).posts.length # 15
