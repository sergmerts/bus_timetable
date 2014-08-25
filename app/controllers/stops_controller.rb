class StopsController < ApplicationController
  def index
    @stops = Stop.all
  end

  def new
    @stop = Stop.new
  end

  def show
    @stop = Stop.find(params[:id])
  end

  def create
    @stop = Stop.new(stop_params)
    if @stop.save
      flash[:notice] = "Stop was added"
      redirect_to stops_path
    else
      render 'new'
    end
  end

  def edit
    @stop = Stop.find(params[:id])
  end

  def update
    @stop = Stop.find(params[:id])
    if @stop.update(stop_params)
      flash[:notice] = "Stop updated."
      redirect_to stops_path(@stop)
    else
      render 'edit'
    end
  end

  def destroy
    @stop = Stop.find(params[:id])
    if @stop.destroy
      flash[:notice] = "The stop was deleted."
      redirect_to stops_path
    end
  end

  private
    def stop_params
      params.require(:stop).permit(:number, :station_id, :line_id)
    end
end
