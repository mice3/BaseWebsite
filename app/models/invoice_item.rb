class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice

  validates_associated :invoice

  after_save :update_invoice_price

  def discount?
    discount
  end

  def update_invoice_price
    tmp_price = 0
    invoice.invoice_items.each do |invoice_item|
      if invoice_item.discount?
        tmp_price = tmp_price - invoice_item.price
      else
        tmp_price = tmp_price + invoice_item.price
      end

    end
    invoice.price = tmp_price
    invoice.save!
  end
end
