class AddStornoToInvoiceAndDiscountToInvoiceItem < ActiveRecord::Migration
  def change
    add_column :invoices, :storno, :boolean, default: false, null: false
    add_column :invoice_items, :discount, :boolean, default: false, null: false
  end
end
