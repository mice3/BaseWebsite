class Payment < ActiveRecord::Base
  belongs_to :project
  belongs_to :our_company
  belongs_to :invoice
  has_many :expenses

  scope :autocomplete_scope, ->(q, user = nil) { where("description LIKE ?", "%#{q}%").select("description as value, id as id") }
  scope :m3_table_admin_autocomplete_scope, ->(q, user = nil) { where("description LIKE ?", "%#{q}%").select("description as value, id as id") }



  def autocomplete_label
    "payment - #{description}"
  end

  def m3_table_admin_autocomplete_label
    "payment - #{description}"
  end


end
