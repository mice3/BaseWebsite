class M3TableAdmin::ExpensesController < M3TableAdmin::ApplicationController

  before_action :set_table

  private

    def set_table
      @table = M3TableAdmin::Table.new("expenses")
      @table.add_autocomplete_column "expense_category", "nice_id"
      @table.add_autocomplete_column "user", "email"
      @table.add_autocomplete_column "payment", "id"
      @table.add_column "price", "text"
      @table.add_column "currency", "text"
      @table.add_column "description", "text"
      @table.add_timestamp_column "spended_at", "%Y-%m-%d"
    end
end
