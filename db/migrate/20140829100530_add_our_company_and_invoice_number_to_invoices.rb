class AddOurCompanyAndInvoiceNumberToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :our_company_id, :integer
    add_column :invoices, :invoice_number, :string
  end
end
