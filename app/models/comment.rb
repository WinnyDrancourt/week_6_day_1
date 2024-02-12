class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_many :likes

  has_many :poly_comments, as: :commentable
end
