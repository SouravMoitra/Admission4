class StreamsController < ApplicationController

  before_action :admin_signin_status, except: [:show]
  before_action :user_signin_status, only: [:show]

  def index
    @streams = Stream.all
  end

  def new
    @stream = Stream.new
  end

  def create
    @stream = Stream.new(streams_params)
    if @stream.save
      flash[:success] = "Stream created"
      redirect_to streams_path
    else
      render 'new'
    end
  end

  def edit
    @stream = Stream.find(params[:id])
  end

  def update
    @stream = Stream.find(params[:id])
    if @stream.update(streams_params)
      flash[:success] = "Stream updated"
      redirect_to streams_path
    else
      render 'edit'
    end
  end

  def destroy
    @stream = Stream.find(params[:id])
    @stream.destroy
    flash[:warning] = "Stream deleted"
    redirect_to streams_path
  end

  def show
    @stream = Stream.find(params[:id])
    @gens = process_result(@stream.id, "GEN")
    @scs = process_result(@stream.id, "SC")
    @sts = process_result(@stream.id, "ST")
    @obcas = process_result(@stream.id, "OBC_A")
    @obcbs = process_result(@stream.id, "OBC_B")
  end

  private

  def streams_params
    params.require(:stream).permit(:name, :GEN, :SC, :ST, :OBC_A, :OBC_B)
  end

  def process_result(stream_id, category)
    sql = "select stream_selectors.user_id from
           stream_selectors inner join personals on
           stream_selectors.user_id = personals.user_id
           where personals.category = '#{category}' and stream_selectors.stream_id = #{stream_id} and verified = true
           order by stream_selectors.calculated_marks"
    ActiveRecord::Base.connection.execute(sql)
  end

end
