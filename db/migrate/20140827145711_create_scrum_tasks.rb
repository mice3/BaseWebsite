class CreateScrumTasks < ActiveRecord::Migration
  def change
    create_table :scrum_tasks do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :description
      t.time :time_to_do
      t.time :time_used
      t.string :not_finished_or_overtime_justification

      t.timestamps
    end
  end
end
