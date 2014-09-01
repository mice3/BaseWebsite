class M3TableAdmin::InvoicesController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("invoices")
      @table.add_autocomplete_column "project", "name"
      @table.add_autocomplete_column "our_company", "name"
      @table.add_column "invoice_number", "text"
      @table.add_column "price", "text"
      @table.add_timestamp_column "sent_at", "%Y-%m-%d %H:%M:%S"

    end
end
