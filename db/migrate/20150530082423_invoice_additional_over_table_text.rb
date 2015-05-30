class InvoiceAdditionalOverTableText < ActiveRecord::Migration
  def change
    add_column :invoices, :before_table_text, :string
  end
end
