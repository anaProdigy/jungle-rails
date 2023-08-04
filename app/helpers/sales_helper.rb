module SalesHelper
  #self.active is in Sale model, AR
  def active_sale
    Sale.active
  end

  def active_sale?
    active_sale.present?
  end

  def active_sale_name
    active_sale ? active_sale.name : "No Active Sale"
  end

  def active_sale_percentage
    active_sale ? active_sale.percent_off : 0
  end

end