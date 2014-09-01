class AddDatesToDocuments < ActiveRecord::Migration
  def change
    add_column :invoices, :sent_at, :datetime
    add_column :payments, :payed_at, :datetime
    add_column :expenses, :spended_at, :datetime
  end
end
