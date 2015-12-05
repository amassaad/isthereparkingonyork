# encoding: utf-8

class WebcamUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    storage :fog
  elsif Rails.env.development?
    storage :file
  end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # def cache_dir
  #   "#{Rails.root}/tmp/uploads"
  # end
  # Choose what kind of storage to use for this uploader:
  # storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "york.jpg" if original_filename
  # end

end
