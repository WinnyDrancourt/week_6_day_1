class ChangeLike < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :gossip_id
    remove_column :likes, :comments_id
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :gossip, foreign_key: true
    add_index :likes, [:user_id, :gossip_id], unique: true
  end
end
