class StreamSelectorsController < ApplicationController

before_action :user_signin_status, only: [:new, :create]

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

    def stream_selector_params
      params.require(:stream_selector).permit(:calculated_marks, :stream_id)
    end

end
