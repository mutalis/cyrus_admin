class Domain < ActiveRecord::Base
  has_many :emails, inverse_of: :domain
  validates :name, presence: true, length: { maximum: 64 }, uniqueness: { case_sensitive: false },
            format: { with: /\A[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,13}\z/ }
  validates :quota, numericality: { only_integer: true , greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

# gets the available quota of the domain
  def avail_quota
  	quota_used = 0
  	emails.each { |email| quota_used += email.quota.to_i }
  	quota.to_i - quota_used
  end
end
