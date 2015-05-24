class M3TableAdmin::AdditionalLawsController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("additional_laws")
      @table.add_column "description"
    end
end
