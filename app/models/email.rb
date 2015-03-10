class Email < ActiveRecord::Base
  belongs_to :domain, inverse_of: :emails
  attr_accessor :confirmation_password
  
  # before_validation :set_email_address, on: :create
  
  validates :password, presence: true, length: { minimum: 8 }
  validates :username, presence: true, length: { maximum: 104 },
             uniqueness: { case_sensitive: false }

  validates_format_of :username, with: ->(email) { /\A[a-zA-Z0-9]+([_\.\-]?[a-zA-Z0-9]+)*@#{Regexp.escape(email.domain.name)}\z/ }

  validates :quota, numericality: { only_integer: true }

  validates :domain, presence: true
  
  default_scope { order(username: :asc) }

  # protected
  # 
  # def set_email_address
  #   self.username += '@' + domain.name
  # end
end
