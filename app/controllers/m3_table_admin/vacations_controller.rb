class M3TableAdmin::VacationsController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("vacations")
      @table.add_autocomplete_column "user", "email"
      @table.add_column "description", "text", {"index" => false}
      @table.add_date_column "start_date"
      @table.add_date_column "end_date"
      @table.add_column "days", "text"

      @table.sort_type = "id DESC"

      @table.custom_header = true

      @user_vacations = {}
      Vacation.all.each do |vacation|
        year = vacation.start_date.strftime("%Y")
        if @user_vacations.has_key?(vacation.user.email)
          if @user_vacations[vacation.user.email].has_key?(year)
            @user_vacations[vacation.user.email][year] = @user_vacations[vacation.user.email][year] + vacation.days
          else
            @user_vacations[vacation.user.email][year] = vacation.days
          end
        else
          @user_vacations[vacation.user.email] = { year => vacation.days }
        end

      end
    end
end
