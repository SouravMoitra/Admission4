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
  def index
    @users = User.paginate(:page => params[:page])
    begin
      @user = User.find(params[:search].to_i) if params[:search]
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "Record not found"
    end
    if params[:str_sle_id] && params[:verified]
      str_sle = StreamSelector.find(params[:str_sle_id])
      str_sle.update(verified: params[:verified] )
      flash[:success] = "Record verified"
    end
  end
end
