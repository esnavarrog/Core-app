class Post < ApplicationRecord

  mount_uploader :img, PostUploader
  mount_uploader :video, VideoUploader
  has_rich_text :content

  belongs_to :girl
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :poly_likes, as: :likeable

  def set_success(format, opts)
    self.success = true
  end
end
