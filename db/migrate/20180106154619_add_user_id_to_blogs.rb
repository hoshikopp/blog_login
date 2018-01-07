class AddUserIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :user_id,:integer
    add_column :users, :user_id,:integer
  end
end
