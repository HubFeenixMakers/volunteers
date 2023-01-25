class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :picture
      t.string :text
      t.date :happened
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
