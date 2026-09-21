class Admin::SitesController < Admin::BaseController
  before_action :set_site, only: %i[edit update destroy]

  def index
    @sites = Site.includes(:rooms).order(:name)
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to admin_sites_path, notice: "Site created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @site.update(site_params)
      redirect_to admin_sites_path, notice: "Site updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @site.destroy
    redirect_to admin_sites_path, notice: "Site deleted."
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :address, :description)
  end
end