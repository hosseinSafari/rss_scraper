class CreateUserSites < ActiveRecord::Migration[6.1]
  def change
    create_table :user_sites do |t|
      t.references :user, foreign_key: true
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
