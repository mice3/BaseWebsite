class WantedSalary < ActiveRecord::Base


  scope :wanted_salary_for_date, -> date {where("? BETWEEN valid_from AND valid_to", date)}
end
