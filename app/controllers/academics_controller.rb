class AcademicsController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#

  before_action :user_signin_status, only: [:new, :create]

  # intializes new academic and associated subject entries
  def new
    # if academic exist it redirect back to root path
    if current_user.academic
      flash[:danger] = "Personal information already filled up"
      redirect_to root_path
    else
      @academic = Academic.new
      5.times { @academic.subject_entries.build }
    end
  end

  # creates new academic and and associates subject_entries
  def create
  	if current_user.academic
      flash[:danger] = "Personal information already filled up"
      redirect_to root_path
    else
  		@academic = Academic.new(academics_params)
  		@academic.user = current_user
  		begin
  			if @academic.save
  				flash[:notice] = "Successfully created your academic infromation"
  				redirect_to root_path
  			else
  				render 'new'
  			end
  		# this check if Record if there are any repeatation in subjects
  		# this is nasty must be replaced
  		rescue ActiveRecord::RecordNotUnique
  			flash.now[:danger] = "Two or more same subjects selected"
  			render 'new'
  		end
  	end
  end

  def returnsubs
    @subject = params[:subject]
    @academic = Academic.new
    7.times { @academic.subject_entries.build }
    render :layout => false
  end

  private

  # strongs parameters
  def academics_params
    params.require(:academic).permit(:tenth_rollno, :tenth_marks, :tenth_board, :tenth_year,
                                      :twelfth_rollno, :twelfth_marks, :twelfth_board,
                                       :twelfth_year, :twelfth_stream , :applied_stream,
                                       subject_entries_attributes: [:id, :subject_id, :marks])
  end


end
