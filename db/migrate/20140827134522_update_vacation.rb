class UpdateVacation < ActiveRecord::Migration
  def change
    add_column :vacations, :start_date, :date
    rename_column :vacations, :date, :end_date
  end
end
