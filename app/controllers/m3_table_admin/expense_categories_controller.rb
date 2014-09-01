class M3TableAdmin::ExpenseCategoriesController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("expense_categories")
      @table.add_column "name", "text", {"index" => true}
      @table.add_column "nice_id", "text", {"index" => true}
      @table.add_column "description", "text", {"index" => false}

    end
end
