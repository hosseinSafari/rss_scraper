class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :url, null: false, unique: true

      t.timestamps
    end
  end
end
