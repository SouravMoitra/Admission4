class Address < ActiveRecord::Base
	belongs_to :personal
	validates :address_line1, presence: true, length: { in: 5..50 }
	validates :address_line2, length: {in: 5..50 }
	validates :town_vill, presence: true
	validates :district, presence: true
	validates :state, presence: true
	validates :country, presence: true
	validates :pin, numericality: { only_integer: true }, :format => { :with => /[1-9]{1}[0-9]{5}/ }

	before_validation :strip_spaces


	private

	def strip_spaces
		self.address_line1 = address_line1.strip
		self.address_line2 = address_line2.strip
		self.town_vill = town_vill.strip
		self.district = district.strip
	end
end
