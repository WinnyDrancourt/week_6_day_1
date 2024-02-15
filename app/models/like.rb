class Like < ApplicationRecord
  #validates :user_id, uniqueness: {scope: gossip_id}
  belongs_to :gossip, optional: true
  belongs_to :user, optional: true
end
