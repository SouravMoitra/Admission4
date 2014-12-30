require 'rails_helper'

RSpec.describe Academic, :type => :model do
  before {
    @user = User.new(email: "user@example.com", password: "foobar20", password_confirmation: "foobar20")
    @academic = @user.build_academic(tenth_rollno: 1111, tenth_marks: 94.67, tenth_year: 2011, tenth_board: "CBSE",
                twelfth_rollno: 1111, twelfth_marks: 84.67, twelfth_year: 2013, twelfth_board: "CBSE", twelfth_stream: "Science")
    }

  subject { @academic }

  it { should respond_to(:tenth_year) }
  it { should respond_to(:tenth_year) }
  it { should respond_to(:twelfth_marks) }
  it { should respond_to(:twelfth_rollno) }
  it { should respond_to(:twelfth_board) }
  it { should respond_to(:tenth_board) }
  it { should respond_to(:tenth_rollno) }
  it { should respond_to(:twelfth_stream)}



  describe "twelfth year empty" do
    before {@academic.twelfth_year = 0 }
    it { should_not be_valid }
  end

  describe "tenth year empty" do
    before {@academic.tenth_year = 0 }
    it { should_not be_valid }
  end

  describe "twelfth board is too long" do
    before { @academic.twelfth_board = "abcdefg" }
    it { should_not be_valid }
  end

  describe "twelfth marks is too low" do
    before { @academic.twelfth_marks = 39 }
    it { should_not be_valid }
  end
  describe "tenth marks is too low" do
    before { @academic.tenth_marks = 39 }
    it { should_not be_valid }
  end
  describe "tenth board is too long" do
    before { @academic.tenth_board = "abcdefg" }
    it { should_not be_valid }
  end

  describe "twelfth year equals tenth year should" do
    before {  @academic.twelfth_year = @academic.tenth_year }
    it { should_not be_valid}
  end
  describe "twelfth year less than tenth year" do
    before :each do
      @academic.twelfth_year = 2010
      @academic.tenth_year = 2012
    end
    it { should_not be_valid}
  end

  describe "tenth year less than 2000" do
    before {@academic.tenth_year = 1999}
    it { should_not be_valid }
  end

  describe "twelfth year less than 1999" do
    before {@academic.twelfth_year = 1999}
    it { should_not be_valid }
  end

  describe "tenth year greater than current year" do
    before {@academic.tenth_year = Date.today.year + 1}
    it { should_not be_valid }
  end

  describe "twelfth year greater than current year" do
    before {@academic.twelfth_year = Date.today.year + 1}
    it { should_not be_valid }
  end
end
