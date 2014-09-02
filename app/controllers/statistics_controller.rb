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

    starting_date = Date.parse("1-2-2012")


    while starting_date.strftime("%m-%Y") != Date.today.strftime("%m-%Y") do
      if !@monthly_earnings.has_key?(starting_date.strftime("%m-%Y"))
        @monthly_earnings[starting_date.strftime("%m-%Y")] = 0
      end
      starting_date = starting_date + 1.month
    end

  end

end
