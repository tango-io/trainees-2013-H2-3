class AddFieldsPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :min, :float
    add_column :pledges, :max, :float
    add_column :pledges, :description
  end
end
