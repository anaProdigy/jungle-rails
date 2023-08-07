require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid with matching passwords" do
        user = User.new(
          first_name: "Ana",
          last_name: "Great",
          email: "test@example.com",
          password: "password",
          password_confirmation: "password"
        )
        expect(user).to be_valid 
    end

      it " requires password to match password confirmation" do
        user = User.new(
          first_name: "Ana",
          last_name: "Great",
          email: "test@example.com",
          password: "password",
          password_confirmation: "helloworld"
        )

        expect(user).not_to be_valid 
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it " requires password to to be set" do
        user = User.new(
          first_name: "Ana",
          last_name: "Great",
          email: "test@example.com",
          password_confirmation: "helloworld"
        )

        expect(user).not_to be_valid 
        expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it " requires password confirmation to be set" do
        user = User.new(
          first_name: "Ana",
          last_name: "Great",
          email: "test@example.com",
          password: "password"
        )

        expect(user).not_to be_valid 
        expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it " requires password to be minimum 5 charachers long " do
        user = User.new(
          first_name: "Ana",
          last_name: "Great",
          email: "test@example.com",
          password: "pass"
        )

        expect(user).not_to be_valid 
        expect(user.errors.full_messages).to include("Password must be minimum 5 charachters")
    end
  
  end

  describe ".authenticate with credentials" do
   before do
    @user = User.create(
      email:"test@example.com",
      password: "password",
      password_confirmation: "password"
    )
   end

   it "returns a user when credentials are valid" do
    authenticated_user = User.authenticate_with_credentials("test@example.com", "password")
    expect(authenticated_user).to eq(@user)
   end

  end
end
