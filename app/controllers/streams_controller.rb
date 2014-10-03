class StreamsController < ApplicationController

  before_action :admin_signin_status

  def index
    @streams = Stream.all
  end

  def new
    @stream = Stream.new
  end

  def create
    @stream = Stream.new(streams_params)
    if @stream.save
      flash[:success] = "Stream created"
      redirect_to streams_path
    else
      render 'new'
    end
  end

  def edit
    @stream = Stream.find(params[:id])
  end

  def update
    @stream = Stream.find(params[:id])
    if @stream.update(streams_params)
      flash[:success] = "Stream updated"
      redirect_to streams_path
    else
      render 'edit'
    end
  end

  def destroy
    @stream = Stream.find(params[:id])
    @stream.destroy
    flash[:warning] = "Stream deleted"
    redirect_to streams_path
  end

  def show
  end

  private

  def streams_params
    params.require(:stream).permit(:name, :GEN, :SC, :ST, :OBC_A, :OBC_B)
  end


end
