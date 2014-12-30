class Academic < ActiveRecord::Base
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#
  require 'date'

  belongs_to :user
  has_many :subject_entries, dependent: :destroy
  accepts_nested_attributes_for :subject_entries, allow_destroy: true, :reject_if => lambda { |a| a[:subject_id].blank? }
  validates_associated :subject_entries


  validates :tenth_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 2000}
  validates :tenth_board, presence: true, length: { maximum: 5}
  validates :tenth_marks, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {only_integer: false, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :twelfth_year, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 2002}
  validates :twelfth_board, presence: true, length: { maximum: 5}
  validates :twelfth_marks, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {only_integer: false, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :tenth_rollno, presence: true
  validates :twelfth_rollno, presence: true
  validates :twelfth_stream, presence: true

  before_validation :strip_strings, :check_tenth_twelfth

  private

  # strips down white spaces
  def strip_strings
    self.tenth_board = tenth_board.strip
    self.twelfth_board = twelfth_board.strip
    self.twelfth_stream = twelfth_stream.strip
  end

  def check_tenth_twelfth
    if tenth_year > twelfth_year
	     errors.add('twelfth_year', "Twelfth year of passing cannot be less than tenth year")
    elsif tenth_year == twelfth_year
      errors.add('twelfth_year', "Tenth year and twelfth year cannot be equal")
    end
    errors.add('tenth_year', "Tenth year must be less than this year") if tenth_year > Date.today.year - 2
    errors.add('twelfth_year', "Twelfth year cannot be in future") if twelfth_year > Date.today.year
  end
end
