class CreateVacantions < ActiveRecord::Migration
  def change
    create_table :vacantions do |t|
      t.integer :user_id
      t.string :description
      t.date :date
      t.float :days
      t.timestamps
    end
  end
end
