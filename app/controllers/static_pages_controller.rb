class StaticPagesController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#
  before_action :user_signin_status, only: [:home, :new_personal, :new_academic ]

  def help
  end

  def home
    @user = current_user
  end

  def about
  end

  def contact
  end



  private
    def user_signin_status
      unless user_signed_in?
        flash[:danger] = "you need to register yourself or sign in"
        redirect_to sign_in_path
      end
    end

    def personal_params
      params.require(:personal).permit(:caste, :date_of_birth, :fathers_name, :mothers_name, :address, :first_name, :last_name, :mobile_no, :gender)
    end
end
