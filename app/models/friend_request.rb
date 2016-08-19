class FriendRequest < ApplicationRecord
belongs_to :user
  belongs_to :friend, class_name: "User"

  validates_presence_of :user, :friend

  def self.find_request user_id_1, user_id_2
    FriendRequest.where("user_id = ? and friend_id = ?", user_id_1, user_id_2).take
  end
end
