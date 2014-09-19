class CreateMinimumSalaries < ActiveRecord::Migration
  def change
    create_table :minimum_salaries do |t|
      t.decimal :net, precision: 15, scale: 2, default: 0.0
      t.decimal :gross, precision: 15, scale: 2, default: 0.0
      t.string :country
      t.integer :year
      t.timestamps
    end
  end
end
