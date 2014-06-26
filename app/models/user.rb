class User < ActiveRecord::Base
  before_save { email.downcase! }
  before_create :create_remember_token
  VALID_USERNAME_REGEX = /\A[a-z\d]{4,16}\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :username,  presence: true, format: { with: VALID_USERNAME_REGEX },
                        length: { minimum: 4, maximum: 16 },
                        uniqueness: { case_sensitive: false}

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password #auto-adds presence validations for password and password_confirmation
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end