class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.string :description
      t.decimal :price, precision: 15, scale: 2, default: 0.0
      t.string :currency, default: 'EUR', null: false
      t.timestamps
    end
  end
end
