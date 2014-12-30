require 'rails_helper'

RSpec.describe Personal, :type => :model do
  before do
    @user = User.new(email: "user@example.com", password: "foobar20", password_confirmation: "foobar20")
    @personal = @user.create_personal(first_name: "test name", last_name: "test last name", date_of_birth: 01-01-1995, mothers_name: "test m name", fathers_name: "Test f name", gender: "M", category: "GEN", photo: "/testphotostring")
  end

  subject { @personal }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:fathers_name) }
  it { should respond_to(:mothers_name) }


  describe "first name empty" do
    before { @personal.first_name = '' }
    it { should_not be_blank}
  end
  describe "last name empty" do
    before { @personal.last_name = '' }
    it { should_not be_blank}
  end
  describe "password_confirmationthers name empty" do
    before { @personal.mothers_name = '' }
    it { should_not be_valid}
  end
  describe "fathers name empty" do
    before { @personal.fathers_name = '' }
    it { should_not be_valid}
  end
end
