class Post < ApplicationRecord
belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  

   validates :user_id, presence: true
   validates :content, presence: true

   def is_liked? user_id, post_id
      likes = Like.where("likeable_id = :post_id AND user_id = :user_id",
              post_id: post_id, user_id: user_id)
      return true if likes.count >0
      return false
    end


end
