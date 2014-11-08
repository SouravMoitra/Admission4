class StreamsController < ApplicationController
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#
  def show
    @stream = Stream.find(params[:id])
    @gens = process_result(@stream.id, "GEN")
    @scs = process_result(@stream.id, "SC")
    @sts = process_result(@stream.id, "ST")
    @obcas = process_result(@stream.id, "OBC_A")
    @obcbs = process_result(@stream.id, "OBC_B")
  end

  private

  # executes a query for displaying result
  # returns a result set
  # parameters : stream_id, category
  def process_result(stream_id, category)
    sql = "select stream_selectors.user_id from
           stream_selectors inner join personals on
           stream_selectors.user_id = personals.user_id
           where personals.category = '#{category}' and stream_selectors.stream_id = #{stream_id} and verified = true
           order by stream_selectors.calculated_marks"
    ActiveRecord::Base.connection.execute(sql)
  end
end
