class StreamSelectorsController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#
  before_action :user_signin_status, only: [:new, :create]
  # intializes new StreamSelector
  # checks if stream selector already filled up for user redirects back
  # also checks if personal and academic infromation has been filled up
  def new
    unless current_user.academic && current_user.personal
      flash[:info] = "Fill up your academic information and personal information first"
      redirect_to root_path
    end
    if current_user.stream_selector
      flash[:danger] = "Stream already selected"
      redirect_to root_path
    else
      @stream_selector = StreamSelector.new
    end
  end
  
  # creates new StreamSelector
  def create
    @stream_selector = StreamSelector.new(stream_selector_params)
    @stream_selector.user = current_user
    if @stream_selector.save
      flash[:notice] = "Successfully created your stream_selector infromation"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  # strong parameters
  def stream_selector_params
    params.require(:stream_selector).permit(:calculated_marks, :stream_id)
  end

end
