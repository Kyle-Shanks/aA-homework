class User < ApplicationRecord
  before_validation :ensure_session_token

  validates :username, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :session_token, presence: true

  def self.find_by_credentials(uname,pw)
    users = User.all.where(username: uname)
    arr = users.select do |u|
      digest = BCrypt::Password.new(u.password_digest)
      digest.is_password?(pw)
    end
    arr[0]
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
  end

  def password
    @password
  end

  def password=(new_pw)
    @password = new_pw
    self.password_digest = BCrypt::Password.create(new_pw)
  end
end
