class Invoice < ActiveRecord::Base
  belongs_to :project
  belongs_to :our_company
  has_many :invoice_items
  has_many :payments

  accepts_nested_attributes_for :invoice_items, allow_destroy: true #, reject_if: :reject_experience_date

  scope :autocomplete_scope, ->(q, user = nil) { where("invoice_number LIKE ?", "%#{q}%").select("invoice_number as value, id as id") }

  attr_accessor :payment_difference

  def storno?
    storno
  end

  def payments_sum
    tmp_payments_sum = 0
    payments.each do |payment|
      tmp_payments_sum = tmp_payments_sum + payment.price
    end
    return tmp_payments_sum
  end

  def autocomplete_label
    invoice_number
  end

  def payment_difference
    "Ammount: #{price} #{currency} / Payed #{payments_sum} #{currency} "
  end

end
