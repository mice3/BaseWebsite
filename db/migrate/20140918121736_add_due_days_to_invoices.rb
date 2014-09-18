class AddDueDaysToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :due_days, :integer
  end
end
