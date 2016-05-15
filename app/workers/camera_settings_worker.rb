class CameraSettingsWorker
  include Sidekiq::Worker

  def perform(task)
    @u = ENV['SECURE_USER']
    @p = ENV['SECURE_PASS']
    @http_conn = Faraday.new do |builder|
      builder.adapter Faraday.default_adapter
    end
    @http_conn.basic_auth(@u, @p)

    case task
    when 1
      @http_conn.get("http://site.zzv.ca:1394/decoder_control.cgi?command=94")
    when 2
      @http_conn.get('http://site.zzv.ca:1394/decoder_control.cgi?command=31')
    when 3
      @http_conn.get('http://site.zzv.ca:1394/decoder_control.cgi?command=33')
    end
  end
end
