class StatisticsController < ApplicationController

  def earnings
    @earnings = Payment.all.order("payed_at DESC")

    date_key = ""
    @monthly_earnings = {}
    @yearly_earnings = {}
    @company_earnings = {}


    @earnings.each do |earning|
      earning_date = earning.payed_at.strftime("%m-%Y")
      if @monthly_earnings.has_key?(earning_date)
        @monthly_earnings[earning_date] = @monthly_earnings[earning_date] + earning.price
      else
        @monthly_earnings[earning_date] = earning.price
      end

      yearly_earning_date = earning.payed_at.strftime("%Y")
      if @yearly_earnings.has_key?(yearly_earning_date)
        @yearly_earnings[yearly_earning_date] = @yearly_earnings[yearly_earning_date] + earning.price
      else
        @yearly_earnings[yearly_earning_date] = earning.price
      end

      if @company_earnings.has_key?(earning.our_company_id)
        @company_earnings[earning.our_company_id] = @company_earnings[earning.our_company_id] + earning.price
      else
        @company_earnings[earning.our_company_id] = earning.price
      end

    end

    starting_date = Date.parse("1-2-2012")


    while starting_date.strftime("%m-%Y") != Date.today.strftime("%m-%Y") do
      if !@monthly_earnings.has_key?(starting_date.strftime("%m-%Y"))
        @monthly_earnings[starting_date.strftime("%m-%Y")] = 0
      end
      starting_date = starting_date + 1.month
    end

    starting_date = Date.parse("1-2-2012")
    while starting_date.strftime("%Y") != Date.today.strftime("%Y") do
      if !@yearly_earnings.has_key?(starting_date.strftime("%Y"))
        @yearly_earnings[starting_date.strftime("%Y")] = 0
      end
      starting_date = starting_date + 1.month
    end

  end

  def salaries
    @salaries = Expense.salaries
    @payments = Payment.all
    @expenses = Expense.all
    @taxes = Expense.taxes
    @dohodnina = Expense.dohodnina

    @user_salaries = {}
    @user_month_salaries = {}

    @salaries.each do |salary|
      if @user_salaries.has_key?(salary.user.email)
        @user_salaries[salary.user.email] = @user_salaries[salary.user.email] + salary.price
      else
        @user_salaries[salary.user.email] = salary.price
      end
    end

    @max_salary = 0
    @user_salaries.keys.each do |key|
      if @user_salaries[key] > @max_salary
        @max_salary = @user_salaries[key]
      end
    end

    @salaries.each do |salary|
      spended_date = salary.spended_at.strftime("%m-%Y")
      if @user_month_salaries.has_key?(spended_date)
        @user_month_salaries[spended_date] << salary
      else
        @user_month_salaries[spended_date] = Array.new
        @user_month_salaries[spended_date] << salary
      end

    end



  end


end
