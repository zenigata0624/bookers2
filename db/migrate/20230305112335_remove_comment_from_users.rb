class RemoveCommentFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :comment, :string
  end
end
