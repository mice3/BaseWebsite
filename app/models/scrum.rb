class Scrum < ActiveRecord::Base
  has_many :scrum_tasks, dependent: :destroy

  accepts_nested_attributes_for :scrum_tasks, allow_destroy: true #, reject_if: :reject_experience_date

end
