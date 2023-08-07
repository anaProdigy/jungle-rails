require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "valid with matching passwords"

    user = User.create(
      email: "test@test.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user).to be_valid 
  end

  describe ".authenticate with credentials"
  end
end
