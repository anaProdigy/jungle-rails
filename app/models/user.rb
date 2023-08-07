class User < ApplicationRecord
  #gives our User model authentication methods via bcrypt
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false, message: "This email already registered, please enter another one" }

  before_validation: :downcase_email

  private

  def downcase_email 
    self.email = email.downcase if email.present?
  end



end
