class AverageSalary < ActiveRecord::Base

  scope :for_year, -> year {where("year=?", year)}
end
