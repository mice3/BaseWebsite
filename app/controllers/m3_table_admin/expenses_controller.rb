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
      @table.add_date_column "spended_at"
      @table.sort_type = "spended_at DESC"

      @table.custom_header = true
      @expenses_ammount = Expense.all.sum(:price)
      @salaries_ammount = Expense.salaries.sum(:price)
      @taxes_ammount = Expense.taxes.sum(:price)
      @dohodnina_ammount = Expense.dohodnina.sum(:price)
      @misc_ammount = Expense.misc.sum(:price)
    end
end
