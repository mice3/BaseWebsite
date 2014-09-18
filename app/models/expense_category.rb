class ExpenseCategory < ActiveRecord::Base
  has_many :expenses

  scope :m3_table_admin_autocomplete_scope, ->(q, user = nil) { where("nice_id ILIKE ?", "%#{q}%").select("nice_id as value, id as id") }
  scope :autocomplete_scope, ->(q, user = nil) { where("nice_id ILIKE ?", "%#{q}%").select("nice_id as value, id as id") }

  def autocomplete_label
    nice_id
  end

  def m3_table_admin_autocomplete_label
    nice_id + " (id = #{id})"
  end


end
