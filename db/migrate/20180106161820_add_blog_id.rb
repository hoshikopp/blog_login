class AddBlogId < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :blog_id,:integer
    add_column :blogs, :blog_id,:integer
    add_column :users, :blog_id,:integer
  end
end
