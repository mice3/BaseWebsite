class Project < ActiveRecord::Base
  belongs_to :partner
  has_many :scrum_tasks
  has_many :invoices

  has_attached_file :image,
                    styles: { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  scope :autocomplete_scope, ->(q, user = nil) { where("name LIKE ?", "%#{q}%").select("name as value, id as id") }
  scope :m3_table_admin_autocomplete_scope, ->(q, user = nil) { where("name LIKE ?", "%#{q}%").select("name as value, id as id") }
  def autocomplete_label
    name
  end

  def m3_table_admin_autocomplete_label
    name
  end
end
