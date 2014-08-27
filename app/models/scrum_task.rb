class ScrumTask < ActiveRecord::Base
  belongs_to :scrum
  belongs_to :user
  belongs_to :project

  validates_associated :scrum
end
