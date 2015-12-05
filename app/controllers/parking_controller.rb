class ParkingController < ApplicationController
  def check
    CameraWorker.perform_async(1)
  end
end
