class M3TableAdmin::PaymentsController < M3TableAdmin::ApplicationController

  before_action :set_table

  private

    def set_table
      @table = M3TableAdmin::Table.new("payments")
      @table.add_autocomplete_column "project", "name"
      @table.add_autocomplete_column "our_company", "name"
      @table.add_autocomplete_column "invoice", "invoice_number"
      @table.add_column "price", "text"
      @table.add_column "currency", "text", {"index" => false}
      @table.add_column "description", "text", {"index" => false}
      @table.add_date_column "payed_at"
      @table.sort_type = "payed_at DESC"
    end
end
