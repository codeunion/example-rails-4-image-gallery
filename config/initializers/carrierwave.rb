if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
  end
else
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = ENV.fetch("AWS_S3_BUCKET_NAME")
    config.aws_acl    = :public_read
    config.asset_host = ENV.fetch("AWS_ASSET_HOST")
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

    config.aws_credentials = {
      access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
  end
end
