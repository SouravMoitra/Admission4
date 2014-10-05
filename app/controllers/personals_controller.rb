class PersonalsController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#
before_action :user_signin_status, only: [:new, :create]

  def new
    if current_user.personal
      flash[:danger] = "Personal information already filled up"
      redirect_to root_path
    else
      @personal = Personal.new
    end
  end

  def create
    @personal = Personal.new(personal_params)
    @personal.user = current_user
    if @personal.save
      flash[:notice] = "Successfully created your personal infromation"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def personal_params
      params.require(:personal).permit(:category, :date_of_birth, :fathers_name, :mothers_name, :address, :first_name, :last_name, :mobile_no, :gender)
    end
end
