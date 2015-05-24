class M3TableAdmin::InvoicesController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("invoices")
      @table.add_autocomplete_column "project", "name"
      @table.add_autocomplete_column "our_company", "name"
      @table.add_autocomplete_column "additional_law", "name"
      @table.add_column "invoice_number", "text"
      @table.add_column "due_days", "text"
      @table.add_column "payment_difference", "text", {"form" => false}
      @table.add_date_column "sent_at"
      @table.add_date_column "service_delivered_at"
      @table.add_dropdown_column "status", Invoice::STATUSES, {"index" => false}
      @table.add_nested_fields "invoice_items", {"fields" => ["description", "price", "discount"], "index" => false}
      @table.sort_type = "sent_at DESC"
      @table.additional_table_buttons = true
      @table.custom_header = true
      @table.filter_statuses = Invoice::STATUSES
      @table.filter_status = "sent"
      if params["filter_status"]
        @table.filter_status = params["filter_status"]
      end

      @invoices_ammount = Invoice.all.sum(:price)
      @payments_ammount = Payment.all.sum(:price)
      @cancelled_ammount = Invoice.where("status='cancelled'").sum(:price)
      @storno_ammount = Invoice.where("status='storno'").sum(:price)
      @invoices_ammount = @invoices_ammount - @storno_ammount
    end
end
