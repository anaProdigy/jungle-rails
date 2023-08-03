class User < ApplicationRecord
  #gives our User model authentication methods via bcrypt
  has_secure_password
  validates :email, uniqueness: { message: "this email already registered, please enter anothor one" }
end
