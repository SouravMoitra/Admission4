class VusersController < ApplicationController
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
