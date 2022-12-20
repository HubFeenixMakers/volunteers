class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.boolean :public

      t.timestamps
    end
  end
end
