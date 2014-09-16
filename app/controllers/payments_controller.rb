class PaymentsController < ApplicationController
  before_action :load_payment, only: [:edit, :show, :update]


  def index
    @payments = Payment.order("updated_at DESC").all
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.save
    respond_to do |format|

      @errors = @payment.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{payments_path}')) }
      end
    end
  end

  def edit

  end

  def update
    @payment.update(payment_params)
    respond_to do |format|

      @errors = @payment.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{payment_path(@payment.id)}')) }
      end
    end
  end

  def show

  end

  private
    def payment_params
      params.require(:payment).permit!  #this will permit all post parameters!
    end

    def load_payment
      @payment = Payment.find(params[:id])
    end

end
