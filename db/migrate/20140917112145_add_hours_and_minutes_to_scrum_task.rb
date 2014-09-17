class AddHoursAndMinutesToScrumTask < ActiveRecord::Migration
  def change
    add_column :scrum_tasks, :hours_planned, :integer, :default => 0
    add_column :scrum_tasks, :minutes_planned, :integer, :default => 0
    add_column :scrum_tasks, :hours_used, :integer, :default => 0
    add_column :scrum_tasks, :minutes_used, :integer, :default => 0
  end
end
