class NotificationsController < ApplicationController
  before_filter :authenticate
  
  def index
    @stations = current_user.stations
  end
  
  def new
    station = Station.find(params[:station_id])
    job = SendNotification.new(current_user,station,
            "#{station.name} will be STATUS 0 until #{parse_time_param(:until,:time).strftime("%I:%M %p")}")
    Delayed::Job.enqueue job
    flash[:notice] ="Your notification for #{station.name} has been sent!"
    redirect_to notifications_path
  end
end
