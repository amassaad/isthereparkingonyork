namespace :camera_positioner do
  desc "Turn off the IR LEDs"
  task no_ir: :environment do
    @u = ENV['SECURE_USER']
    @p = ENV['SECURE_PASS']

    @http_conn = Faraday.new do |builder|
      builder.adapter Faraday.default_adapter
    end
    @http_conn.basic_auth(@u, @p)

    @http_conn.get("http://webcam.zzv.ca:1394/decoder_control.cgi?command=94")
  end

  desc "Reposition to the default location"
  task reposition_request: :environment do
    @u = ENV['SECURE_USER']
    @p = ENV['SECURE_PASS']

    @http_conn = Faraday.new do |builder|
      builder.adapter Faraday.default_adapter
    end

    @http_conn.basic_auth(@u, @p)
    @http_conn.get 'http://webcam.zzv.ca:1394/decoder_control.cgi?command=31'
  end

end
