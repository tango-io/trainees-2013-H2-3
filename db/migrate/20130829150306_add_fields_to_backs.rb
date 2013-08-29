class AddFieldsToBacks < ActiveRecord::Migration
  def change
    add_column :backs , :pledge_id, :integer
  end
end
