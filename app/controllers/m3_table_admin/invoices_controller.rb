class M3TableAdmin::InvoicesController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("invoices")
      @table.add_autocomplete_column "project", "name"
      @table.add_autocomplete_column "our_company", "name"
      @table.add_column "invoice_number", "text"
      @table.add_column "payment_difference", "text", {"form" => false}
      @table.add_nested_fields "invoice_items", {"fields" => ["description", "price", "discount"], "index" => false}
      @table.add_date_column "sent_at"
      @table.sort_type = "sent_at DESC"
      @table.additional_table_buttons = true
      @table.custom_header = true
      # @table.filter_statuses = ["not_paid", "paid", "storno"]

      @test = Invoice.all
    end
end
