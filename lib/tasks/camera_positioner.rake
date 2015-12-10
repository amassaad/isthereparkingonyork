namespace :camera_positioner do
  desc "Turn off the IR LEDs"
  task no_ir: :environment do
    CameraSettingsWorker.perform_async(1)
  end

  desc "Reposition to the default location"
  task reposition_request: :environment do
    CameraSettingsWorker.perform_async(2)
  end
end
