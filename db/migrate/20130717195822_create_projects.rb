class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer    :user_id
      t.string     :category_id
      t.string     :name
      t.string     :city
      t.datetime   :close_date
      t.text       :description
      t.integer    :amount
      t.integer    :money_raised
      t.string     :video_url
      t.timestamps
    end
  end
end
