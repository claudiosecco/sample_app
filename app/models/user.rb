class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token

  before_save :downcase_email
  before_save :create_activation_digest

  validates :name,  presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  # allow_nil only for update purpose. When creating new user,
  # has_secure_password doesn't allow empty passwords

  class << self
    # Returns the hash digest of a given string
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end    

    # Returns a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end


  # Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  # Returns true if a given token matches the digest
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil) 
  end

  # Activates an account
  def activate
    self.update_attribute(:activated,    true)
    self.update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

  def downcase_email
    self.email.downcase!
  end
    
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(self.activation_token)
  end
end
