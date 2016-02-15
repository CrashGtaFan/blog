# User
class User < ActiveRecord::Base
  before_create :build_default_profile

  has_secure_password
  validates_uniqueness_of :email
  has_one :profile
  has_many :posts, dependent: :destroy
  has_many :favourite_posts
  validates_presence_of :name
  validates_presence_of :lastname
  validates_presence_of :email
  validates_presence_of :password, on: :create
  mount_uploader :avatar, AvatarUploader
  self.per_page = 10

  private

  def build_default_profile
    build_profile
  end
end
