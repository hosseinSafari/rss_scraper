class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :description, null: false

      t.references :user, foreign_key: true
      t.references :feed, foreign_key: true

      t.timestamps
    end
  end
end
