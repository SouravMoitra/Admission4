class SubjectEntry < ActiveRecord::Base
  belongs_to :academic
  validates :subject_id, presence: true, inclusion: {in: Subject.all.collect {|sub| sub.id}}
  validates :marks, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 100}
  validates_uniqueness_of :subject_id, scope: :academic_id
end
