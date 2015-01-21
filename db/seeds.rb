require 'factory_girl_rails'

# 10.times do 
#   FactoryGirl.create(:domain)
# end

FactoryGirl.create_list(:domain,10)
FactoryGirl.create_list(:email,10)
