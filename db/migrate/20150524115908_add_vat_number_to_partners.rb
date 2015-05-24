class AddVatNumberToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :vat_number, :string
    add_column :invoices, :service_delivered_at, :datetime
    add_column :invoices, :additional_law_id, :integer
  end
end
