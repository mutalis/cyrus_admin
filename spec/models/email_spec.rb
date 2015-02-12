require 'rails_helper'

RSpec.describe Email, :type => :model do

  subject(:email) { FactoryGirl.create(:email) }

  it { is_expected.to validate_numericality_of :quota }
  
  it { is_expected.to validate_presence_of :username }
  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  it { expect(email.username).to match(/\A[a-zA-Z0-9]+([_\.\-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,13}\z/) }
  it { is_expected.to validate_length_of(:username).is_at_most(40) }

  it { is_expected.to belong_to(:domain).inverse_of(:emails) }
  it { is_expected.to validate_presence_of :domain }
  
  it { is_expected.to have_db_index(:username) }
end
