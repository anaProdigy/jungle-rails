require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.create(name: "Test Category")
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(
        name: 'Test Product1',
        price: 1000,
        quantity: 10,
        category: @category 
      )
      @product2 = Product.create!(
        name: 'Test Product2',
        price: 2000,
        quantity: 5,
        category: @category 
      )
      # Setup at least one product that will NOT be in the order
      @product_not_in_order = Product.create!(
        name: 'Test Product3',
        price: 5000,
        quantity: 8,
        category: @category 
      )
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'test_order@gmail.com', # this is current user email
        total_cents: 1000,
        stripe_charge_id: 1,
      )
      # 2. build line items on @order
     
      @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: @product1.price,
        total_price: @product1.price * 1
      )
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: @product2.price,
        total_price: @product2.price * 2
      )
   
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(9)
    end
    # pending test 2
   it 'does not deduct quantity from products that are not in the order' do
    #   # TODO: Implement based on hints in previous test
     # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'test_order@gmail.com', # this is current user email
        total_cents: 1000,
        stripe_charge_id: 1,
      )
      # 2. build line items on @order
     
      @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: @product1.price,
        total_price: @product1.price * 1
      )
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: @product2.price,
        total_price: @product2.price * 2
      )
   
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect( @product_not_in_order.quantity).to eq(8)
   end
  end
end
