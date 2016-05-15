namespace :camera_positioner do
  desc "Turn off the IR LEDs"
  task no_ir: :environment do
    CameraSettingsWorker.perform_async(1)
  end

  desc "Reposition to the default location"
  task reposition_request: :environment do
    CameraSettingsWorker.perform_async(2)
  end

  desc "Reposition to the second location"
  task second_position_request: :environment do
    CameraSettingsWorker.perform_async(3)
  end
end
