class AddSidToUser < ActiveRecord::Migration
  def change
    add_column :users, :student_id, :string
    add_index :users, :student_id, unique: true
  end
end
