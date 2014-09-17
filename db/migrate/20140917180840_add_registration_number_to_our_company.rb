class AddRegistrationNumberToOurCompany < ActiveRecord::Migration
  def change
    add_column :our_companies, :registration_number, :string
  end
end
