class CreateWantedSalaries < ActiveRecord::Migration
  def change
    create_table :wanted_salaries do |t|
      t.decimal :net, precision: 15, scale: 2, default: 0.0
      t.date :valid_from
      t.date :valid_to
      t.timestamps
    end
  end
end
