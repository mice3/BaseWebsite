class M3TableAdmin::WantedSalariesController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("wanted_salaries")
      @table.add_column "net"
      @table.add_date_column "valid_from"
      @table.add_date_column "valid_to"
    end
end
