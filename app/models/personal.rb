class Personal < ActiveRecord::Base
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#
  belongs_to :user
  has_one :address, dependent: :destroy
  validates :first_name, presence: true, length: { in: 3..24}
  validates :last_name, presence: true, length: { in: 3..24}
  validates :date_of_birth, presence: true
  validates :gender, presence: true, length: { maximum: 1}, inclusion: { in: %w(M F 0) }
  validates :category, presence: true, length: {maximum: 5}, inclusion: { in: %w(GEN SC ST OBC_A OBC_B) }
  validates :fathers_name, presence: true, length: { maximum: 50}
  validates :mothers_name, presence: true, length: { maximum: 50}
  validates :mobile_no, presence: true , :format => { :with => /[7-9]{1}[0-9]{9}/ }
  validates :photo, presence: true
  accepts_nested_attributes_for :address
  before_validation :strip_strings
  validates_associated :address

  mount_uploader :photo, PhotoUploader

  private

  # strips down white spaces
  def strip_strings
    self.first_name = first_name.strip
    self.last_name = last_name.strip
    self.gender = gender.strip
    self.category = category.strip
    self.fathers_name = fathers_name.strip
    self.mothers_name = mothers_name.strip
  end
end
