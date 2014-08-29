class Invoice < ActiveRecord::Base
  belongs_to :project
  belongs_to :our_company
  has_many :invoice_items

  accepts_nested_attributes_for :invoice_items, allow_destroy: true #, reject_if: :reject_experience_date



end
