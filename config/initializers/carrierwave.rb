# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV["AWS_BUCKET"]
  config.aws_acl    = "public-read"

  config.aws_credentials = {
      access_key_id:     ENV["AKIAYL7LSOU3DBDSPXUA"],
      secret_access_key: ENV["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"],
      region:            ENV["us-east-1"]
  }
end