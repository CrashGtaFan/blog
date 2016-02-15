# Post
class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :favourite_posts
  belongs_to :user
  has_and_belongs_to_many :categories
  validates :title, presence: true, length: { minimum: 5 }
  validates :body,  presence: true

  mount_uploader :image, ImageUploader

  self.per_page = 10
end
