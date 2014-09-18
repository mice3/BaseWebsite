class M3TableAdmin::ScrumsController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("scrums")

      @table.add_date_column "date"
      @table.add_date_column "finished_at"
      @table.sort_type = "id DESC"
      @table.enable_destroy = false
      @table.enable_edit = false
      @table.enable_add_new = false
    end
end
