class User < ApplicationRecord
  #gives our User model authentication methods via bcrypt
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false, message: "This email already registered, please enter another one" }

  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 5, message: "must be minimum 5 charachters"}
  # prevent from regestering same email but using Capital letters
  before_validation :downcase_email

  #Define a new class method to authenticate USER
  def self.authenticate_with_credentials (email, password)
    normalized_email = email.downcase.strip
    user = User.find_by_email(normalized_email)
 # If the user exists AND the password entered is correct.
      if user && user.authenticate(password)
        return user
      end  

    return nil
  end



  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
