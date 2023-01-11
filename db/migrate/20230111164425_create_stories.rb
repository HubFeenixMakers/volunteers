class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.references :member
      t.string :picture
      t.string :header
      t.text :text
      t.date :happened

      t.timestamps
    end
  end
end
