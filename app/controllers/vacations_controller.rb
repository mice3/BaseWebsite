class VacationsController < ApplicationController
  def index
    @vacations = Vacation.order("user_id DESC").all

    @vacation_user_hash = {}
    @vacations.each do |vacation|
      if @vacation_user_hash.has_key?(vacation.user.email)
        @vacation_user_hash[vacation.user.email] << vacation
      else
        @vacation_user_hash[vacation.user.email] = Array.new
        @vacation_user_hash[vacation.user.email] << vacation
      end
    end
  end

  def show
  end

  def new
    @vacation = Vacation.new
  end

  def create
    @vacation = Vacation.new(vacation_params)
    @vacation.user = current_user
    @vacation.save
    respond_to do |format|

      @errors = @vacation.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{vacations_path}')) }
      end
    end
  end

  private
    def vacation_params
      params.require(:vacation).permit!  #this will permit all post parameters!
    end
end
