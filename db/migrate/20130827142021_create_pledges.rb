class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :option
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
