class Gossip < ApplicationRecord
  belongs_to :user

  has_many :poly_comments, as: :commentable

  has_many :likes
  has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags

end