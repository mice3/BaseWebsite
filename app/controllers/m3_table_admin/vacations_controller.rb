class M3TableAdmin::VacationsController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("vacations")
      @table.add_autocomplete_column "user", "email"
      @table.add_column "description", "text", {"index" => false}
      @table.add_date_column "start_date"
      @table.add_date_column "end_date"
      @table.add_column "days", "text"

      @table.sort_type = "id DESC"
    end
end
