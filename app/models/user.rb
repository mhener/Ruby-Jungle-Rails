class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true, length: {minimum: 8}

  def self.authenticate_with_credentials(email, password)
    filtered_email = email.downcase.strip
    @user = User.find_by_email(filtered_email)
    @user if @user && @user.authenticate(password)
  end
  
end
