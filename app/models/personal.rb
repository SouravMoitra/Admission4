class Personal < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true, length: { maximum: 24}
  validates :last_name, presence: true, length: { maximum: 24}
  validates :date_of_birth, presence: true
  validates :gender, presence: true, length: { maximum: 1}, inclusion: { in: %w(M F 0) }
  validates :category, presence: true, length: {maximum: 5}, inclusion: { in: %w(GEN SC ST OBC_A OBC_B) }
  validates :fathers_name, presence: true, length: { maximum: 50}
  validates :mothers_name, presence: true, length: { maximum: 50}
  validates :mobile_no, presence: true , :format => { :with => /[7-9]{1}[0-9]{9}/ }
  validates :address, presence: true, length: { in: 10..100 }

  before_validation :strip_strings

  private

  def strip_strings
    self.first_name = first_name
    self.last_name = last_name
    self.gender = gender
    self.category = category
    self.fathers_name = fathers_name
    self.mothers_name = mothers_name
    self.address = address
  end
end
