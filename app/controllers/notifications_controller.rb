class NotificationsController < ApplicationController
  before_filter :authenticate
  
  def index
  end
  
  def create
    flash[:notice] ="Your notification has been sent!"
    redirect_to notifications_path
  end
end
