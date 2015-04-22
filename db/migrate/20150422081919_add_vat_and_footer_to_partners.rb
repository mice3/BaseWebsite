class AddVatAndFooterToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :vat, :string
    add_column :partners, :footer_text, :text
  end
end
