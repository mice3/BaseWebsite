class AddStatusToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :status, :string
  end
end
