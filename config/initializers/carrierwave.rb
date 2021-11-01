# CarrierWave.configure do |config|
#     config.fog_credentials = {
#       :provider => 'AWS',
#       :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
#       :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY_ID'],
#       :region => ENV['AWS_REGION'],
#     }
    
  
#     # For testing, upload files to local `tmp` folder.
#     if Rails.env.test? || Rails.env.cucumber?
#       config.storage = :file
#       config.enable_processing = false
#       config.root = "#{Rails.root}/tmp"
#     else
#       config.storage = :fog
#     end
  
#     config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
  
#     config.fog_directory    = ENV['S3_BUCKET']
#     # config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
#     # config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['BUCKETEER_BUCKET_NAME']}"
#   end