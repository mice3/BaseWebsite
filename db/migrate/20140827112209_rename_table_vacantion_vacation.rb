class RenameTableVacantionVacation < ActiveRecord::Migration
  def change
    rename_table :vacantions, :vacations
  end
end
