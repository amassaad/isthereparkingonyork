if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:               'AWS',
      region:                 'us-west-2',
      aws_access_key_id:      ENV['PARKING_ID'],
      aws_secret_access_key:  ENV['PARKING_KEY']
    }
    config.fog_public = true
    config.fog_directory  = 'york-parking'
  end
end
