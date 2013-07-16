class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string     :nickname
      t.string     :firstname
      t.string     :lastname
      t.string     :email
      t.string     :category
      t.string     :profile_photo
      t.timestamps
    end
  end
end
