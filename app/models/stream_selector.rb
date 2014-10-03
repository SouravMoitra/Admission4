class StreamSelector < ActiveRecord::Base
  belongs_to :user
  validate :check_marks
  before_create :calculate_marks, :streams_marks


  def check_marks
    stream = Stream.find(stream_id)
    sub_maps = stream.sub_str_maps.all
    xuser = self.user
    cat = xuser.personal.category
    academic = xuser.academic
    sub_mark = sub_maps.pluck(cat)

    user_subs = academic.subject_entries.all
    ok = false
    i = 0
    sub_maps.each do |su|
      ok = false
       user_subs.each do |as|
         if su.subject_id === as.subject_id
           if sub_mark[i] <= as.marks
             ok = true
           end
         end
       end
       unless ok
         errors.add(:stream_id, "This stream cannot be choosen since you dont have required marks/subject")
         break
       end
       i += 1
    end
    ok
  end

  def calculate_marks
    stream = Stream.find(stream_id)
    sub_maps = stream.sub_str_maps.all
    xuser = self.user
    xcategory = xuser.personal.category
    xacademic = xuser.academic
    tenth_mark = xacademic.tenth_marks
    user_subs = xacademic.subject_entries.all
    total_special_sub = sub_maps.count
    total = 0
    user_subs.each do |us|
      total += us.marks
      sub_maps.each do |sm|
        if us.subject_id == sm.subject_id
          total += us.marks
        end
      end
    end
    self.calculated_marks = total*10000 + tenth_mark
  end

  def streams_marks
    xuser = self.user
    xcategory = xuser.personal.category
    stream = Stream.where(id: stream_id)
    required_marks = stream.pluck(xcategory)[0]

    if required_marks < xuser.academic.twelfth_marks
      errors.add(:stream_id, "Error total marks in twelfth standard is not sufficient")
    end
  end

end
