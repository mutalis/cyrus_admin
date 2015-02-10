class Domain < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false },
            format: { with: /\A[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,13}\z/ }
  validates :quota, numericality: { only_integer: true }
end
