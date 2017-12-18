class CreateUsersHasNeedies < ActiveRecord::Migration[5.0]
  def change
    create_table :users_has_needies do |t|
      t.references :user, foreign_key: true
      t.references :needy, foreign_key: true

      t.timestamps
    end
  end
end
