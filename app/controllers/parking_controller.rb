class ParkingController < ApplicationController
  def check
    CameraImageWorker.perform_async(1)
  end
end
