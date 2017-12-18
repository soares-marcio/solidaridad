class CreateNeedies < ActiveRecord::Migration[5.0]
  def change
    create_table :needies do |t|
      t.string :name
      t.string :address
      t.string :latitude
      t.string :longitude
      t.text :description
      t.integer :quantity_person

      t.timestamps
    end
  end
end
