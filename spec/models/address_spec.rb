require 'rails_helper'

RSpec.describe Address, :type => :model do
  before { @address = Address.new(address_line1: "p-221/10 UB road", address_line2: "BEHALA Airport road", country: "IN", town_vill: "Kolkata", district: "Kolkata" , state: "WB", pin: 700060 )}

  subject { @address }

  it { should respond_to(:address_line1)}
  it { should respond_to(:address_line2)}
  it { should respond_to(:town_vill)}
  it { should respond_to(:address_line1)}
  it { should respond_to(:district)}
  it { should respond_to(:state)}
  it { should respond_to(:pin)}
  it { should respond_to(:country)}

  describe "address line 1" do
    describe "not present" do
      before { @address.address_line1 = '' }
      it { should_not be_blank }
    end

    describe "too long" do
      before { @address.address_line1 = "a" * 51 }
      it { should_not be_valid }
    end

    describe "too  short" do
      before { @address.address_line1 = "abcd" }
      it { should_not be_valid }
    end
  end
  describe "address line 2" do

    describe "too long" do
      before { @address.address_line2 = "a" * 51 }
      it { should_not be_valid }
    end

    describe "too  short" do
      before { @address.address_line2 = "abcd" }
      it { should_not be_valid }
    end
  end

  describe "country not present" do
    before { @address.country = '' }
    it { should_not be_valid }
  end

  describe "town and village not present" do
    before { @address.town_vill = ''}
    it { should_not be_valid }
  end

  describe "state not present" do
    before { @address.state = ''}
    it { should_not be_valid }
  end
  describe "district not present" do
    before { @address.district = ''}
    it { should_not be_valid }
  end
  describe "when pin format is invalid" do
    it "should be invalid" do
      pins = %w[1 22 33 4444 055555]
        pins.each do |invalid_pin|
          @address.pin = invalid_pin
          expect(@address).not_to be_valid
        end
      end
    end

    describe "when email format is valid" do
      it "should be valid" do
        pins = %w[123456 987654 700000]
        pins.each do |valid_pin|
          @address.pin = valid_pin
          expect(@address).to be_valid
        end
      end
    end
end
