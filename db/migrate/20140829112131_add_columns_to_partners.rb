class AddColumnsToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :address, :string
    add_column :partners, :zip_code, :string
    add_column :partners, :city, :string
    add_column :partners, :country, :string
    add_column :partners, :attention_to, :string
  end
end
