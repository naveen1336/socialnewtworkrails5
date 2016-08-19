class User < ApplicationRecord
has_secure_password

 has_many :friend_requests, dependent: :destroy
  has_many :invitees, through: :friend_requests, source: :friend

  has_many :friend_invites, class_name: "FriendRequest", foreign_key: :friend_id, dependent: :destroy
  has_many :inviters, through: :friend_invites, source: :user
has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


def feed
    Post.where("user_id IN (:friend_ids) OR user_id = :user_id",
      friend_ids: friend_ids, user_id: id)
  end

  def add_friend other_user
    friendships.create(friend_id: other_user.id)
    other_user.friendships.create(friend_id: self.id)
  end

  def friend? other_user
    friends.include?(other_user)
  end

  def invite other_user
    friend_requests.create(friend_id: other_user.id)
    other_user.friend_invites.create(friend_id: self.id)
  end

  def accept_invite invite
    other_user = User.find(invite.id)
    add_friend other_user
    a = self.friend_requests.where(:friend_id => invite.id)
    a.destroy_all
    return true
  end

end
