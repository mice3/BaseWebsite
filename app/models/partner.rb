class Partner < ActiveRecord::Base
  has_many :projects

  scope :autocomplete_scope, ->(q, user = nil) { where("name ILIKE ?", "%#{q}%").select("name as value, id as id") }

  def autocomplete_label
    name
  end

end
