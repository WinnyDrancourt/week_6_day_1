class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|

      t.belongs_to :gossip, index: true

      t.timestamps
    end
  end
end
