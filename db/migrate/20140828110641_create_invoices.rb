class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :project_id
      t.decimal :price, precision: 15, scale: 2, default: 0.0
      t.string :currency, default: 'EUR', null: false
      t.timestamps
    end
  end
end
