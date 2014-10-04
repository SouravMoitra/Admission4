class AcademicsController < ApplicationController

before_action :user_signin_status, only: [:new, :create]

def new
  if current_user.academic
    flash[:danger] = "Personal information already filled up"
    redirect_to root_path
  else
    @academic = Academic.new
    5.times { @academic.subject_entries.build}
  end
end

def create
  @academic = Academic.new(academics_params)
  @academic.user = current_user
  begin
    if @academic.save
      flash[:notice] = "Successfully created your academic infromation"
      redirect_to root_path
    else
      render 'new'
    end
  rescue ActiveRecord::RecordNotUnique
    flash[:danger] = "Two or more same subjects selected"
    render 'new'
  end
end

private

def academics_params
  params.require(:academic).permit(:tenth_rollno, :tenth_marks, :tenth_board, :tenth_year,
                                    :twelfth_rollno, :twelfth_marks, :twelfth_board,
                                     :twelfth_year, :twelfth_stream , :applied_stream,
                                     subject_entries_attributes: [:id, :subject_id, :marks])
end


end
