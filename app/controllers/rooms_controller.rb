class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:site).all
  end

  def show
    @room = Room.find(params[:id])
  end
end
