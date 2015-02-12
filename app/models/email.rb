class Email < ActiveRecord::Base
  belongs_to :domain, inverse_of: :emails
  attr_accessor :confirmation_password
  # validates :password, length: { minimum: 8 }
  validates :username, presence: true, length: { maximum: 40 },
            format: { with: /\A[a-zA-Z0-9]+([_\.\-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,13}\z/ },
            uniqueness: { case_sensitive: false }

  validates :quota, numericality: { only_integer: true }

  validates :domain, presence: true
end
