class ParkingController < ApplicationController
  def check
    CameraImageWorker.perform_async(1)
    sleep(2)
  end
end
