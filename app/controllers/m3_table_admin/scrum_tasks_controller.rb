class M3TableAdmin::ScrumTasksController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("scrum_tasks")
      @table.add_autocomplete_column "scrum", "date"
      @table.add_autocomplete_column "user", "email"
      @table.add_autocomplete_column "project", "name"
      @table.add_column "description", "text", {"index" => false}
      @table.add_column "hours_planned", "text", {"index" => true}
      @table.add_column "minutes_planned", "text", {"index" => true}
      @table.add_column "hours_used", "text", {"index" => true}
      @table.add_column "minutes_used", "text", {"index" => true}

      @table.sort_type = "id DESC"
    end
end
