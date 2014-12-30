require 'rails_helper'

RSpec.describe Stream, :type => :model do
  before { @stream = Stream.new(name: "BSc Maths", GEN: 80, SC: 78, ST: 77, OBC_A: 76, OBC_B: 75) }

  subject { @stream }
  it { should respond_to(:name) }
  it { should respond_to(:GEN) }
  it { should respond_to(:SC) }
  it { should respond_to(:ST) }
  it { should respond_to(:OBC_B) }
  it { should respond_to(:OBC_A) }

  describe "name empty" do
    before { @stream.name = "" }
    it { should_not be_blank}
  end

  describe "Gen marks less than 40" do
    before { @stream.GEN = 39 }
    it { should_not be_valid }
  end

  describe "Gen greater than 100" do
    before { @stream.GEN = 101 }
    it { should_not be_valid }
  end

  describe "SC marks less than 40" do
    before { @stream.SC = 39 }
    it { should_not be_valid }
  end

  describe "SC greater than 100" do
    before { @stream.SC = 101 }
    it { should_not be_valid }
  end

  describe "ST marks less than 40" do
    before { @stream.ST = 39 }
    it { should_not be_valid }
  end

  describe "ST greater than 100" do
    before { @stream.ST = 101 }
    it { should_not be_valid }
  end

  describe "OBC_A marks less than 40" do
    before { @stream.OBC_A = 39 }
    it { should_not be_valid }
  end

  describe "OBC_A greater than 100" do
    before { @stream.OBC_A = 101 }
    it { should_not be_valid }
  end

  describe "OBC_B marks less than 40" do
    before { @stream.OBC_B = 39 }
    it { should_not be_valid }
  end

  describe "OBC_B greater than 100" do
    before { @stream.OBC_B = 101 }
    it { should_not be_valid }
  end

end
