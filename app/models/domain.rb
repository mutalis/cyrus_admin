class Domain < ActiveRecord::Base
  has_many :emails, inverse_of: :domain
  validates :name, presence: true, length: { maximum: 64 }, uniqueness: { case_sensitive: false },
            format: { with: /\A[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,13}\z/ }
  validates :quota, numericality: { only_integer: true }
end
