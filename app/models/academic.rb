class Academic < ActiveRecord::Base
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#
  belongs_to :user
  has_many :subject_entries
  accepts_nested_attributes_for :subject_entries
  validates_associated :subject_entries


  validates :tenth_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 2000, less_than_or_equal_to: 2012}
  validates :tenth_board, presence: true, length: { maximum: 5}
  validates :tenth_marks, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {only_integer: false, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :twelfth_year, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 2002, less_than_or_equal_to: 2014}
  validates :twelfth_board, presence: true, length: { maximum: 5}
  validates :twelfth_marks, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {only_integer: false, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :tenth_rollno, presence: true
  validates :twelfth_rollno, presence: true
  validates :twelfth_stream, presence: true

  before_validation :strip_strings

  private

  def strip_strings
    self.tenth_board = tenth_board
    self.twelfth_board = twelfth_board
    self.twelfth_stream = twelfth_stream
  end
end
