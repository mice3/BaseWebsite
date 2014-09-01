class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :expense_category_id
      t.decimal :price, precision: 15, scale: 2, default: 0.0
      t.string :currency, default: 'EUR', null: false
      t.text :description
      t.timestamps
    end
  end
end
