# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  before_validation :ensure_session_token

  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :username, :email, presence: true, uniqueness: true
  validates :password_digest, :session_token, presence: true
  validate :valid_email

  attr_reader :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def self.find_by_credentials(name_or_email, password)
    if EMAIL_REGEX.match(name_or_email)
      user = User.find_by(email: name_or_email)
    else
      user = User.find_by(username: name_or_email)
    end

    return user if user && user.is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    bcrypt_pw = BCrypt::Password.new(self.password_digest)
    bcrypt_pw.is_password?(pw)
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def valid_email
    self.errors[:email] << 'must be a valid email' unless EMAIL_REGEX.match(self.email)
  end
end
