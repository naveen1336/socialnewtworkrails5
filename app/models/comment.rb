class Comment < ApplicationRecord
belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy

  validates_presence_of :user, :content

  def is_liked? user, id
      likes = Like.where("likeable_id = :comment_id AND user_id = :user_id",
        comment_id: id, user_id: user.id)
      likes.any?
    end

end
