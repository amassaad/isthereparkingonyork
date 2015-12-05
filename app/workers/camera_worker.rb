class CameraWorker
  include Sidekiq::Worker

  sidekiq_options throttle: { threshold: 2, period: 1.minute }

  def perform(id)
    @u = ENV['SECURE_USER']
    @p = ENV['SECURE_PASS']
    logger.info "Things are starting to happen in the camera worker job."

    @http_conn = Faraday.new do |builder|
      builder.adapter Faraday.default_adapter
    end

    @http_conn.basic_auth(@u, @p)  unless @u.nil? && @p.nil?
    response = @http_conn.get 'http://webcam.zzv.ca:1394/snapshot.cgi'
    logger.info "Trying to make save happen. With success? [status code: #{response.status}]"

    File.open("tmp/york.jpg", "wb") { |fp| fp.write(response.body) }
    file = File.open("tmp/york.jpg")

    uploader = WebcamUploader.new
    uploader.store!(file)

    logger.info "Saved file. maybe."
  end
end
