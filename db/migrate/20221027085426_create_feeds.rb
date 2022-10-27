class CreateFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :feeds do |t|
      t.string :url, null: false, unique: true
      t.string :title, null: false
      t.string :description
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
