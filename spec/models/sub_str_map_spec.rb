require 'rails_helper'

RSpec.describe SubStrMap, :type => :model do
  before { @sub_maps = SubStrMap.new(subject_id: 3, GEN: 80, SC: 78, ST: 77, OBC_A: 76, OBC_B: 75) }

  subject { @sub_maps }
  it { should respond_to(:subject_id)}
  it { should respond_to(:GEN) }
  it { should respond_to(:SC) }
  it { should respond_to(:ST) }
  it { should respond_to(:OBC_B) }
  it { should respond_to(:OBC_A) }

  describe "Gen less than 40" do
    before { @sub_maps.GEN = 39 }
    it { should_not be_valid }
  end

  describe "Gen greater than 100" do
    before { @sub_maps.GEN = 101 }
    it { should_not be_valid }
  end

  describe "SC marks less than 40" do
    before { @sub_maps.SC = 39 }
    it { should_not be_valid }
  end

  describe "SC greater than 100" do
    before { @sub_maps.SC = 101 }
    it { should_not be_valid }
  end

  describe "ST marks less than 40" do
    before { @sub_maps.ST = 39 }
    it { should_not be_valid }
  end

  describe "ST greater than 100" do
    before { @sub_maps.ST = 101 }
    it { should_not be_valid }
  end

  describe "OBC_A marks less than 40" do
    before { @sub_maps.OBC_A = 39 }
    it { should_not be_valid }
  end

  describe "OBC_A greater than 100" do
    before { @sub_maps.OBC_A = 101 }
    it { should_not be_valid }
  end

  describe "OBC_B marks less than 40" do
    before { @sub_maps.OBC_B = 39 }
    it { should_not be_valid }
  end

  describe "OBC_B greater than 100" do
    before { @sub_maps.OBC_B = 101 }
    it { should_not be_valid }
  end
end
