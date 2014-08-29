class AddPartnerIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :partner_id, :integer
  end
end
