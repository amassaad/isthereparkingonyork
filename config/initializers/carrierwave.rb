if Rails.env.production? || Rails.env.staging?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog'                        # required
    config.fog_credentials = {
      provider:               'AWS',
      region:                 'us-west-1',                        # required
      aws_access_key_id:      ENV['PARKING_ID'],                        # required
      aws_secret_access_key:  ENV['PARKING_KEY']
    }
    config.fog_public = true
    config.fog_directory  = 'york-parking-bucket'                          # required
  end
end
