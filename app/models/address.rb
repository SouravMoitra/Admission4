class Address < ActiveRecord::Base
	belongs_to :personal
	validates :address_line1, presence: true, length: { in: 5..15 }
	validates :address_line2, length: {in: 5..15 }
	validates :town_vill, presence: true
	validates :district, presence: true
	validates :state, presence: true, inclusion: { in: :state_list }
	validates :pin, numericality: { only_integer: true }, :format => { :with => /[1-9]{1}[0-9]{5}/ }

	before_validation :strip_spaces

	def state_list
		%w(
		  Andra_Pradesh
			Arunachal Pradesh
			Assam
			Bihar
			Chhattisgarh
			Goa
			Gujarat
			Haryana
			Himachal_Pradesh
			Jammu_and_Kashmir
			Jharkhand
			Karnataka
			Kerala
			Madya_Pradesh
			Maharashtra
			Manipur
			Meghalaya
			Mizoram
			Nagaland
			Orissa
			Punjab
			Rajasthan
			Sikkim
			Tamil Nadu
			Telangan
			Tripura
			Uttaranchal
			Uttar_Pradesh
			West_Bengal
			Andaman_and_Nicobar_Islands
			Chandigarh
			Dadar_and_Nagar_Haveli
			Daman_and_Diu
			Delhi
			Lakshadeep
			Pondicherry
		)
	end

	private

	def strip_spaces
		self.address_line1 = address_line1.strip
		self.address_line2 = address_line2.strip
		self.town_vill = town_vill.strip
		self.district = district.strip
	end
end
