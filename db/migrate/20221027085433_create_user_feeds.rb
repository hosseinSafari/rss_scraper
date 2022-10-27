class CreateUserFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :user_feeds do |t|
      t.boolean :read, default: false
      t.boolean :favorit, default: false
      t.boolean :bookmark, default: false
      t.references :user, foreign_key: true
      t.references :feed, foreign_key: true

      t.timestamps
    end
  end
end
