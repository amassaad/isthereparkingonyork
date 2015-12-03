class ParkingController < ApplicationController
  def check
    CameraWorker.perform_async
  end
end
