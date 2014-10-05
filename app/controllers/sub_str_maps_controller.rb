class SubStrMapsController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#
  before_action :admin_signin_status

  # lists all Subject stream mappings
  def index
    @sub_str_maps = SubStrMap.all
  end

  # renders new Subject stram mapping
  def new
    @sub_str_map = SubStrMap.new
  end

  # creates new subject stream mapping
  def create
    @sub_str_map = SubStrMap.new(sub_str_maps_params)
    if @sub_str_map.save
      flash[:success] = "SubStrMap created"
      redirect_to sub_str_maps_path
    else
      render 'new'
    end
  end

  # renders subject stream mapping for edit
  def edit
    @sub_str_map = SubStrMap.find(params[:id])
  end

  #updates subject stream mapping
  def update
    @sub_str_map = SubStrMap.find(params[:id])
    if @sub_str_map.update(sub_str_maps_params)
      flash[:success] = "SubStrMap updated"
      redirect_to sub_str_maps_path
    else
      render 'edit'
    end
  end

  # destroys the subject stream mapping
  def destroy
    @sub_str_map = SubStrMap.find(params[:id])
    @sub_str_map.destroy
    flash[:warning] = "SubStrMap deleted"
    redirect_to sub_str_maps_path
  end

  def show
  end

  private

  # strong parameters
  def sub_str_maps_params
    params.require(:sub_str_map).permit(:stream_id, :subject_id, :GEN, :SC, :ST, :OBC_A, :OBC_B)
  end
end
