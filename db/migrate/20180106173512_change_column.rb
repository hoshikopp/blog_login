class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :blog_id
  end
end
