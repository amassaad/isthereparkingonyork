class CameraImageWorker
  include Sidekiq::Worker
  @u = ENV['SECURE_USER']
  @p = ENV['SECURE_PASS']

  sidekiq_options throttle: { threshold: 240, period: 60.minute }

  def perform(id)
    StatsD.measure('CameraImageWorker.performance') do
      logger.info "Things are starting to happen in the camera Image worker job."
      StatsD.increment('CameraImageWorker.start')

      @http_conn = Faraday.new do |builder|
        builder.adapter Faraday.default_adapter
      end

      @http_conn.basic_auth(@u, @p)
      response = @http_conn.get "http://site.zzv.ca:1394/snapshot.cgi"
      logger.info "Trying to make save happen. With success? [status code: #{response.status}]"

      File.open("tmp/york.jpg", "wb") { |fp| fp.write(response.body) }
      file = File.open("tmp/york.jpg")


          # response = @connection.get('snapshot.cgi')
          # response.success? ? ::MiniMagick::Image.read(response.body) : nil

      uploader = WebcamUploader.new
      uploader.store!(file)
      StatsD.increment('CameraImageWorker.complete')
    end
  end
end
