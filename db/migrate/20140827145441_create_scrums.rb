class CreateScrums < ActiveRecord::Migration
  def change
    create_table :scrums do |t|
      t.date :date
      t.time :finished_at
      t.timestamps
    end
  end
end
