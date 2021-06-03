class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :nickname
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
