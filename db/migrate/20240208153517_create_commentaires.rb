class CreateCommentaires < ActiveRecord::Migration[7.1]
  def change
    create_table :commentaires do |t|
      t.text :content
      t.references :commentable, polymorphic: true, null: false

      t.belongs_to :user, index: true
      t.belongs_to :gossip, index: true
      t.belongs_to :commentaire, index: true

      t.timestamps
    end
  end
end