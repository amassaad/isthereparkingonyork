class WebcamUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    storage :fog
  elsif Rails.env.development?
    storage :file
  end

  def store_dir
    "uploads"
  end

  def extension_white_list
    %w(jpg jpeg gif)
  end
end
