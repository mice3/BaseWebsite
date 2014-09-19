class MinimumSalary < ActiveRecord::Base

  scope :for_year_and_country, -> year, country {where("year=? and country=?", year, country)}
end
