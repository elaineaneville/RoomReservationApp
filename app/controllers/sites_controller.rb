class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def show
    @sites = Site.find(params[:id])
    @rooms = @sites.rooms
  end
end
