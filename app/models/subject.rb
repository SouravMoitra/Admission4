class Subject < ActiveRecord::Base
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#
  has_many :sub_str_maps, dependent: :destroy
  validates :name, presence: true, length: { in: 4..20 }

  before_validation :strip_strings

  private

  # strips down white spaces
  def strip_strings
    self.name = name.strip
  end
end
