class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_rich_text :body
  has_many :user_post_likes, dependent: :destroy
end
