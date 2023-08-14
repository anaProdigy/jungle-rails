# preview the email that would be sent by the OrderMailer
class OrderMailerPreview < ActionMailer::Preview
  def order_receipt
    user = User.last # Or any user you want to use for previewing
    order = Order.last # Or any order you want to use for previewing
    OrderMailer.order_receipt(user, order)
  end
end