class CreateAdditionalLaws < ActiveRecord::Migration
  def change
    create_table :additional_laws do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
