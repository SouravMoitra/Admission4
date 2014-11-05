class PersonalsController < ApplicationController
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#

  before_action :user_signin_status, only: [:new, :create]

  # intializes personal
  # redirects back if personal information already created
  def new
    if current_user.personal
      flash[:danger] = "Personal information already filled up"
      redirect_to root_path
    else
      @personal = Personal.new
      @personal.build_address
    end
  end

  # creates personal inforamtion
  def create
    if current_user.personal
      flash[:danger] = "Personal information already filled up"
      redirect_to root_path
    else
      @personal = Personal.new(personal_params)
      @personal.user = current_user
      if @personal.save
        flash[:notice] = "Successfully created your personal infromation"
        redirect_to root_path
      else
        render 'new'
      end
    end
  end

  def subregion_options
    render partial: 'subregion_select'
  end

  private

  # strong parameters
  def personal_params
    params.require(:personal).permit(:category, :date_of_birth, :fathers_name, :photo, :mothers_name, :first_name, :last_name, :mobile_no, :gender, address_attributes: [:id, :address_line1, :address_line2, :town_vill, :district, :state, :pin, :country])
  end
end
