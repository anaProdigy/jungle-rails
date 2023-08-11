class OrderMailerPreview < ActionMailer::Preview
  def order_receipt
    user = User.first # Or any user you want to use for previewing
    order = Order.first # Or any order you want to use for previewing
    OrderMailer.order_receipt(user, order)
  end
end