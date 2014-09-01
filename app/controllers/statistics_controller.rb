class StatisticsController < ApplicationController

  def earnings
    @earnings = Payment.all.order("payed_at DESC")

    date_key = ""
    @monthly_earnings = {}

    @earnings.each do |earning|
      earning_date = earning.payed_at.strftime("%m-%Y")
      if @monthly_earnings.has_key?(earning_date)
        @monthly_earnings[earning_date] = @monthly_earnings[earning_date] + earning.price
      else
        @monthly_earnings[earning_date] = earning.price

      end
    end
  end

end
