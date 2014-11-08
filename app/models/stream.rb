class Stream < ActiveRecord::Base
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#
  extend FriendlyId
  has_many :sub_str_maps, dependent: :destroy

  validates :name, presence: true, length: { in: 6..20 }
  validates :GEN, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :SC, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :ST, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :OBC_A, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :OBC_B, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  friendly_id :name, use: :slugged

  before_validation :strip_strings

  private

  # strips down white spaces
  def strip_strings
    self.name = name.strip
  end
end
