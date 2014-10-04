class Subject < ActiveRecord::Base
  has_many :sub_str_maps
  validates :name, presence: true, length: { in: 4..20 }

  before_validation :strip_strings

  private

  def strip_strings
    self.name = name.strip
  end
end
