class InvoicesController < ApplicationController
  before_action :load_invoice, only: [:edit, :show, :update]

  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.save
    respond_to do |format|

      @errors = @invoice.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{invoices_path}')) }
      end
    end
  end

  def show
    respond_to do |format|
      format.pdf do
        render :pdf => "invoice", :template => 'invoices/show.haml'
      end
      format.html
    end
  end

  def index
    @invoices = Invoice.order("updated_at DESC").all
  end

  def edit
    @invoice.invoice_items.build
  end

  def update
    @invoice.update(invoice_params)
    respond_to do |format|

      @errors = @invoice.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{invoice_path(@invoice.id)}')) }
      end
    end
  end

  private
    def invoice_params
      params.require(:invoice).permit!  #this will permit all post parameters!
    end

    def load_invoice
      @invoice = Invoice.find(params[:id])
    end

end
