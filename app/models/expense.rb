class Expense < ActiveRecord::Base
  belongs_to :expense_category
  belongs_to :user
  belongs_to :payment

  scope :salaries, -> {
    joins(:expense_category)
    .where("nice_id = ?", "salary")
  }

  scope :taxes, -> {
    joins(:expense_category)
    .where("nice_id IN (?) ", ["pokojninski_prispevek", "prispevki_zdravstveno_zavarovanje", "taxes_cresnik_sp", "taxes_nagode_sp"])
  }

  scope :dohodnina, -> {
    joins(:expense_category)
    .where("nice_id IN (?) ", ["akontacija_dohodnine", "akontacija_dohodnine_cresnik_sp", "akontacija_dohodnine_nagode_sp"])
  }
end
