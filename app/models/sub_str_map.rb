class SubStrMap < ActiveRecord::Base
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#
  belongs_to :stream
  belongs_to :subject

  validates :subject_id, presence: true
  validates :GEN, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :SC, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :ST, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :OBC_A, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :OBC_B, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
end
