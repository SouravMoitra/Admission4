class SubjectsController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#
  before_action :admin_signin_status

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subjects_params)
    if @subject.save
      flash[:success] = "Subject created"
      redirect_to subjects_path
    else
      render 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subjects_params)
      flash[:success] = "Subject updated"
      redirect_to subjects_path
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:warning] = "Subject deleted"
    redirect_to subjects_path
  end

  def show
  end

  private

  def subjects_params
    params.require(:subject).permit(:name)
  end

end
