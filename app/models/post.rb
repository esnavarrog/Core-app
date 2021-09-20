class Post < ApplicationRecord

  mount_uploader :img, PostUploader
  mount_uploader :video, VideoUploader

  belongs_to :girl
  has_rich_text :content

  def set_success(format, opts)
    self.success = true
  end
end
