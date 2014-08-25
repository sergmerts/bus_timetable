class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def show
    @line = Line.find(params[:id])
  end

  def create
    @line = Line.new(line_params)

    if @line.save
      flash[:notice] = "Line was added"
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      flash[:notice] = "Line updated."
      redirect_to lines_path(@line)
    else
      render 'edit'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    if @line.destroy
      flash[:notice] = "The line was deleted."
      redirect_to lines_path
    end
  end

private
  def line_params
    params.require(:line).permit(:name, station_ids: [])
  end
end
