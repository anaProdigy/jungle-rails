class Order < ApplicationRecord

  #after successful creation of an order do...callback to deduct the product quantities
  after_create :deduct_product_quantities
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  private

  #terates through the line items of the order and updates the quantities of associated products
  def deduct_product_quantities
    line_items.each do |line_item|
      product = line_item.product 
      product.update(quantity: product.quantity - line_item.quantity)
    end
  end
end
