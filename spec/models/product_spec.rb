require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
    @category = Category.create(name: "Test Category")
    end

    it "saves successfully with all four fields set" do
    # create a product with all fields set
      product = Product.create(
        name: 'Test Product',
        price: 10.99,
        quantity: 5,
        category: @category
      )
      
      expect(product).to be_valid
    end

    it "requires name to be set" do
    # create a product with name missing
      product = Product.create(
        price: 10.99,
        quantity: 5,
        category: @category
      )

      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "requires price to be set" do
    # create a product with price missing
      product = Product.create(
        name: 'Test Product',
        quantity: 5,
        category: @category
      )

      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

  end
end
