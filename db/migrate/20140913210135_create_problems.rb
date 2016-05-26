class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.text :hint
      t.integer :point
      t.string :flag

      t.timestamps
    end
  end
end
