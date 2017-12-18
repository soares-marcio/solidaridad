class CreateNeediesHasCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :needies_has_categories do |t|
      t.references :category, foreign_key: true
      t.references :needy, foreign_key: true

      t.timestamps
    end
  end
end
