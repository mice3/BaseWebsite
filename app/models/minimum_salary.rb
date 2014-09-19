class MinimumSalary < ActiveRecord::Base

  scope :for_year, -> year {where("year=?", year)}
end
