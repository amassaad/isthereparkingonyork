class CameraWorker
  include Sidekiq::Worker

  def perform
    logger.info "Things are happening."
    logger.debug "Here's some info: #{hash.inspect}"
    @http_conn = Faraday.new do |builder|
      builder.adapter Faraday.default_adapter
    end
    @u = "alex"
    @p = "testing"

    @http_conn.basic_auth(@u, @p)  unless @u.nil? && @p.nil?
    response = @http_conn.get 'http://webcam.zzv.ca:1394/snapshot.cgi'

    File.open('public/york.jpg', 'wb') { |fp| fp.write(response.body) }
  end
end
