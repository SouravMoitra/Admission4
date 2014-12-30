require 'rails_helper'

RSpec.describe SubjectEntry, :type => :model do
  before { @subject_entry = SubjectEntry.new(subject_id: 2, marks: 90) }

  subject { @subject_entry }

  it { should respond_to(:subject_id)}
  it { should respond_to(:marks)}

  describe "subject_id not present" do
    before { @subject_entry.subject_id = 0 }
    it { should_not be_valid }
  end

  describe "marks" do
    describe "less than 40" do
      before { @subject_entry.marks = 39}
      it { should_not be_valid }
    end
    describe "greater than 100" do
      before { @subject_entry.marks = 101}
      it { should_not be_valid }
    end
  end
end
