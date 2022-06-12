class VideoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
  include CarrierWave::Processing::RMagick

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  
  process :save_video_duration
  process :watermark_movie
  process :encode

  PROCESSED_DEFAULTS = { 
    resolution: :same,
    video_bitrate: :same,
    video_codec: 'libx264',
    constant_rate_factor: '30',
    audio_codec: 'aac',
    audio_bitrate: '64k',
    audio_sample_rate: '44100'
  }

  def save_video_duration
    video = Time.at(FFMPEG::Movie.new(file.file).duration).utc.strftime("%H:%M:%S")
    res = FFMPEG::Movie.new(file.file).resolution
    model.duration = video
    model.resolution = res
  end

  def watermark_movie
    num = rand((1..8).to_a.length)
    case num
    when 0..2
      position = "LB"
    when 3..5
      position = "LT"
    else
      position = "RB"
    end
    options = {watermark: "#{Rails.root}/app/assets/images/watermark.png", watermark_filter: {position: position, padding_x: 10, padding_y: 10}}
    #debugger
    tmp_path = File.join File.dirname(current_path), "tmp_file.mp4"
    file = FFMPEG::Movie.new(self.file.path)
    file.transcode tmp_path, options
    File.rename tmp_path, current_path
  end

  def encode
    if FFMPEG::Movie.new(file.file).video_codec != 'h264'
      encode_video(:mp4, PROCESSED_DEFAULTS) do |movie, params|
        if movie.height < 720
          params[:watermark][:path] = Rails.root.join('watermark.png')
        end
      end
    end
  end

  version :thumb do
    process thumbnail: [{format: 'jpg', quality: 10, strip: false, size: 720, logger: Rails.logger}]
    def full_filename for_file
      png_name for_file, version_name
    end
  end
  
  def png_name for_file, version_name
    %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  end

  # version :mp4 do
  #   process :encode_video => [:mp4]
  #   def full_filename(for_file)
  #     "#{File.basename(for_file, File.extname(for_file))}.mp4"
  #   end
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(mov mp4 3gp mkv webm m4v avi)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
