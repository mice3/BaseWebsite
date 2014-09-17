class Scrum < ActiveRecord::Base
  has_many :scrum_tasks, dependent: :destroy

  accepts_nested_attributes_for :scrum_tasks, allow_destroy: true #, reject_if: :reject_experience_date

  scope :for_current_month, -> month { where("EXTRACT(MONTH from date) = ?", month) }

  scope :m3_table_admin_autocomplete_scope, ->(q, user = nil) { where("date LIKE ?", "%#{q}%").select("date as value, id as id") }
  scope :autocomplete_scope, ->(q, user = nil) { where("date LIKE ?", "%#{q}%").select("date as value, id as id") }


  def m3_table_admin_autocomplete_label
    date
  end

  def autocomplete_label
    date
  end

end
