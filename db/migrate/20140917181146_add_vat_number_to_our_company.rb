class AddVatNumberToOurCompany < ActiveRecord::Migration
  def change
    add_column :our_companies, :vat_number, :string
  end
end
