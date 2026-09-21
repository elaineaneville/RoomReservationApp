class Admin::RoomsController < Admin::BaseController
  before_action :set_room, only: %i[edit update destroy]

  def index
    @rooms = Room.includes(:site).order(:name)
  end

  def new
    @room = Room.new
    load_sites
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to admin_rooms_path, notice: "Room created."
    else
      load_sites
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    load_sites
  end

  def update
    if @room.update(room_params)
      redirect_to admin_rooms_path, notice: "Room updated."
    else
      load_sites
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    redirect_to admin_rooms_path, notice: "Room deleted."
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def load_sites
    @sites = Site.order(:name)
  end

  def room_params
    params.require(:room).permit(:name, :capacity, :description, :site_id)
  end
end