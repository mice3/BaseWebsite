class AdditionalLaw < ActiveRecord::Base
  has_many :invoices

  scope :autocomplete_scope, ->(q, user = nil) { where("name LIKE ?", "%#{q}%").select("name as value, id as id") }
  scope :m3_table_admin_autocomplete_scope, ->(q, user = nil) { where("name ILIKE ?", "%#{q}%").select("name as value, id as id") }

 def m3_table_admin_autocomplete_label
    name
  end

end
