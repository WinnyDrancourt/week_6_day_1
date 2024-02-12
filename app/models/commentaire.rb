class Commentaire < ApplicationRecord
    belongs_to :user
    belongs_to :gossip
    has_many :likes
    belongs_to :commentable, polymorphic: true, optional:true
    has_many :commentaires, as: :commentable
end
