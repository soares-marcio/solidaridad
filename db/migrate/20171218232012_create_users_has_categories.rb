class CreateUsersHasCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :users_has_categories do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
