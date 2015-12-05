CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['PARKING_KEY'],                        # required
    aws_secret_access_key: ENV['PARKING_ID'],
    region:                'us-west-2'                           # required
  }
  config.fog_directory  = 'yorkparking'                          # required
end
