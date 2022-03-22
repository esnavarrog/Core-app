class Post < FilterableRecord

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

  def self.fetch(options = {})
    collection = super(options)
    # collection = search_filter(collection,["name", "service"], options)
    # collection = section_filter(collection,options)
    # collection = attribute_filter(collection,"status",options)
  end

end
