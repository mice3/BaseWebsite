class Payment < ActiveRecord::Base
  belongs_to :project
  belongs_to :our_company
  belongs_to :invoice

  scope :autocomplete_scope, ->(q, user = nil) { where("id LIKE ?", "%#{q}%").select("id as value, id as id") }

  def autocomplete_label
    id
  end

end
