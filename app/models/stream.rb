class Stream < ActiveRecord::Base
  has_many :sub_str_maps

  validates :name, presence: true, length: { in: 6..20 }
  validates :GEN, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :SC, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :ST, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :OBC_A, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates :OBC_B, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}

  before_validation :strip_strings

  private

  def strip_strings
    self.name = name.strip
  end
end
