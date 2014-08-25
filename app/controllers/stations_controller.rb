class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def show
    @station = Station.find(params[:id])
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

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      flash[:notice] = "Station updated."
      redirect_to station_path(@station)
    else
      render 'edit'
    end
  end

  def destroy
    @station = Station.find(params[:id])
    if @station.destroy
      flash[:notice] = "The station was deleted."
      redirect_to stations_path
    end
  end

  private
    def station_params
      params.require(:station).permit(:name, :line_ids)
    end
end
