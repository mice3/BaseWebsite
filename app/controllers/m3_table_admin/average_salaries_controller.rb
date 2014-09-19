class M3TableAdmin::AverageSalariesController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("average_salaries")
      @table.add_column "net"
      @table.add_column "gross"
      @table.add_column "country"
      @table.add_column "year"
    end
end
