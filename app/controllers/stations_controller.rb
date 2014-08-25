class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "Station was added"
      redirect_to stations_path
    else
      render 'new'
    end
  end

  private
  def station_params
    params.require(:station).permit(:name)
  end
end
