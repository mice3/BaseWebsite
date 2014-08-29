class CreateOurCompanies < ActiveRecord::Migration
  def change
    create_table :our_companies do |t|
      t.string :name
      t.string :reference_number
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :trr
      t.string :bank
      t.string :swift_bic_code
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.timestamps
    end
  end
end
