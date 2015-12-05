class CameraWorker
  include Sidekiq::Worker

  def perform
    logger.info "Things are happening in the cameara loader."
    #todo with s3 support
    @http_conn = Faraday.new do |builder|
      builder.adapter Faraday.default_adapter
    end
    @u = ENV['SECURE_USER']
    @p = ENV['SECURE_PASS']

    @http_conn.basic_auth(@u, @p)  unless @u.nil? && @p.nil?
    response = @http_conn.get 'http://webcam.zzv.ca:1394/snapshot.cgi'
    logger.info "Trying to make save happen. With success?"

    WebcamUploader.new.store!(response.body)

    logger.info "Saved file. With success?"
    # File.open("public/york.jpg", "wb") { |fp| fp.write(response.body) }
  end
end
