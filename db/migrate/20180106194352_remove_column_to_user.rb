class RemoveColumnToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :blog_id
  end
end
