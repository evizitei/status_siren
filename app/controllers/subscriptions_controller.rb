class SubscriptionsController < ApplicationController
  before_filter :authenticate
  
  def new
    @subscription = current_user.subscriptions.new
    @stations = current_user.department.stations
  end
  
  def create
    station = Station.find(params[:subscription][:station_id])
    if current_user.subscribed_to?(station)
      flash[:notice] = "You are already subscribed to messages for #{station.name}"
    else
      current_user.subscriptions.create!(params[:subscription])  
    end
    redirect_to root_path
  end
end