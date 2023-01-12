class AddArrivedToMemberss < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :arrived, :date
    add_column :members, :left, :date
  end
end
