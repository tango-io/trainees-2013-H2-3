class CreateBacks < ActiveRecord::Migration
  def change
    create_table :backs do |t|
      t.integer :amount
      t.string :comment
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
