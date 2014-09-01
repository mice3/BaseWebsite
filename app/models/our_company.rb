class OurCompany < ActiveRecord::Base
  has_many :invoices
  has_many :payments

  scope :autocomplete_scope, ->(q, user = nil) { where("name LIKE ?", "%#{q}%").select("name as value, id as id") }

  def autocomplete_label
    name
  end
end
