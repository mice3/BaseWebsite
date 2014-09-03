class Expense < ActiveRecord::Base
  belongs_to :expense_category
  belongs_to :user
  belongs_to :payment
end
