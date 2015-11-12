class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 25 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end
end
