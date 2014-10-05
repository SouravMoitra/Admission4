class SubjectEntry < ActiveRecord::Base
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#
  belongs_to :academic
  validates :subject_id, presence: true, inclusion: {in: Subject.all.collect {|sub| sub.id}}
  validates :marks, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates_uniqueness_of  :academic_id, scope: :subject_id
end
