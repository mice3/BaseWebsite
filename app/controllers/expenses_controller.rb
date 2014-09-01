class ExpensesController < ApplicationController
  before_action :load_expense, only: [:edit, :show, :update]


  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.save
    respond_to do |format|

      @errors = @expense.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{expense_path}')) }
      end
    end
  end

  def edit

  end

  def update
    @expense.update(expense_params)
    respond_to do |format|

      @errors = @expense.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{expense_path(@expense.id)}')) }
      end
    end
  end

  def show

  end

  private
    def expense_params
      params.require(:expense).permit!  #this will permit all post parameters!
    end

    def load_expense
      @expense = Expense.find(params[:id])
    end

end
