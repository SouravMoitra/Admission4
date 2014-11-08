class StaticPagesController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#
  before_action :user_signin_status, only: [:home, :new_personal, :new_academic, :print ]

  def help
  end

  def home
    # this is required for displaying user personal and academic data
    @user = current_user
  end

  def print
    # this is required for printing user personal and academic data
    @user = current_user
  end

  def about
  end

  def contact
  end

  private
  # strong params
  def personal_params
    params.require(:personal).permit(:caste, :date_of_birth, :fathers_name, :mothers_name, :address, :first_name, :last_name, :mobile_no, :gender)
  end
end
