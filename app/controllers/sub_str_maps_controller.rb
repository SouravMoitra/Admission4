class SubStrMapsController < ApplicationController

  before_action :admin_signin_status
  
  def index
    @sub_str_maps = SubStrMap.all
  end

  def new
    @sub_str_map = SubStrMap.new
  end

  def create
    @sub_str_map = SubStrMap.new(sub_str_maps_params)
    if @sub_str_map.save
      flash[:success] = "SubStrMap created"
      redirect_to sub_str_maps_path
    else
      render 'new'
    end
  end

  def edit
    @sub_str_map = SubStrMap.find(params[:id])
  end

  def update
    @sub_str_map = SubStrMap.find(params[:id])
    if @sub_str_map.update(sub_str_maps_params)
      flash[:success] = "SubStrMap updated"
      redirect_to sub_str_maps_path
    else
      render 'edit'
    end
  end

  def destroy
    @sub_str_map = SubStrMap.find(params[:id])
    @sub_str_map.destroy
    flash[:warning] = "SubStrMap deleted"
    redirect_to sub_str_maps_path
  end

  def show
  end

  private

  def sub_str_maps_params
    params.require(:sub_str_map).permit(:stream_id, :subject_id, :GEN, :SC, :ST, :OBC_A, :OBC_B)
  end
end
