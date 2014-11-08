class VusersController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#

  # renders verifiers view
  # also renderslist of users and paginate them using will_paginate gem
  # searches users using get method
  # confirms user registration using get method
  before_action :verfier_signin_status

  def index
    @users = User.paginate(:page => params[:page])
  end

  def doverify
    if params[:user_id]
      user = User.find(params[:user_id].to_i)
      strslector = user.stream_selector
      strslector.update_attributes(verified: true);
      flash[:success] = "Verified"
      redirect_to verify_path
    end
  end

  def search
    begin
      if params[:id]
        @user = User.find(params[:id].to_i)
      elsif params[:email]
        @user = User.find_by_email(params[:email])
      end
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "Record not found"
      redirect_to verify_path
    end
    render :layout => false
  end
end
