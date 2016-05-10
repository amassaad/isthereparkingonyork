class CameraSettingsWorker
  include Sidekiq::Worker

  def perform(task)
    case task
    when 1
      @u = ENV['SECURE_USER']
      @p = ENV['SECURE_PASS']
      @http_conn = Faraday.new do |builder|
        builder.adapter Faraday.default_adapter
      end
      @http_conn.basic_auth(@u, @p)

      @http_conn.get("http://site.zzv.ca:1394/decoder_control.cgi?command=94")
    when 2
      @u = ENV['SECURE_USER']
      @p = ENV['SECURE_PASS']
      @http_conn = Faraday.new do |builder|
        builder.adapter Faraday.default_adapter
      end
      @http_conn.basic_auth(@u, @p)

      @http_conn.get('http://site.zzv.ca:1394/decoder_control.cgi?command=31')
    end
  end
end
