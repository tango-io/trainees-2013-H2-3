class ChangeCategoryIdToIntegerFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :category_id, :string
    add_column :projects, :category_id, :integer
    add_index :projects, :category_id
  end
end
