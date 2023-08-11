class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Order Receipt - Order ##{order.id}")
  end
end
