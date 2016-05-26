class AddCategoryToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :category, :integer, :default => 0
  end
end
