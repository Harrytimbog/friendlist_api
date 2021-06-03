class AddCategoryToFriend < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :category, :string
  end
end
