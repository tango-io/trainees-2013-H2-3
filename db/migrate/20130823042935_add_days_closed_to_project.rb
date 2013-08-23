class AddDaysClosedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :days_closed, :integer
  end
end
