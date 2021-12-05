class Post < ApplicationRecord

  mount_uploader :img, PostUploader
  mount_uploader :video, VideoUploader

  belongs_to :girl
  belongs_to :user
  has_many :comments, as: :commentable
  has_rich_text :content

  def set_success(format, opts)
    self.success = true
  end
end
