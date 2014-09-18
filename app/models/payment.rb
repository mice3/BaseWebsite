class Payment < ActiveRecord::Base
  belongs_to :project
  belongs_to :our_company
  belongs_to :invoice
  has_many :expenses

  scope :autocomplete_scope, ->(q, user = nil) { where("description LIKE ?", "%#{q}%").select("description as value, id as id") }
  scope :m3_table_admin_autocomplete_scope, ->(q, user = nil) { where("description LIKE ?", "%#{q}%").select("description as value, id as id") }

  after_save :change_invoice_status

  def change_invoice_status
    if invoice.price == invoice.payments_sum
      invoice.paid_all!
    elsif invoice.payments_sum != 0 && invoice.price > invoice.payments_sum
      invoice.paid_part!
    elsif invoice.price < invoice.payments_sum
      invoice.paid_more!
    end
  end

  def autocomplete_label
    "payment - #{description}"
  end

  def m3_table_admin_autocomplete_label
    "payment - #{description}"
  end


end
