class AddPaymentIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :payment_id, :integer
  end
end
