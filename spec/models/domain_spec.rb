require 'rails_helper'

RSpec.describe Domain, :type => :model do

  it "has a valid factory" do
     expect(build(:domain)).to be_valid
  end
   
  subject(:domain) { FactoryGirl.create :domain_with_emails }
  # let(:email) { FactoryGirl.create(:email) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { expect(domain.name).to match(/\A[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,13}\z/) }
  it { is_expected.to validate_length_of(:name).is_at_most(64) }

  it { is_expected.to validate_numericality_of(:quota).only_integer }
  it { is_expected.to validate_numericality_of(:quota).is_greater_than_or_equal_to(1) }
  it { is_expected.to validate_numericality_of(:quota).is_less_than_or_equal_to(1000) }
  
  it { is_expected.to have_many(:emails).inverse_of(:domain) }

  it { is_expected.to have_db_index(:name) }
  
end
