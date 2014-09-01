class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :project_id
      t.integer :our_company_id
      t.integer :invoice_id
      t.decimal :price, precision: 15, scale: 2, default: 0.0
      t.string :currency, default: 'EUR', null: false
      t.text :description
      t.timestamps
    end
  end
end
