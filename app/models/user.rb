class User < ApplicationRecord
  #gives our User model authentication methods via bcrypt
  has_secure_password
end
