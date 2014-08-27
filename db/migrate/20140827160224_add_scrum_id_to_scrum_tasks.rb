class AddScrumIdToScrumTasks < ActiveRecord::Migration
  def change
    add_column :scrum_tasks, :scrum_id, :integer
  end
end
