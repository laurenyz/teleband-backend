class StudentAssignment < ApplicationRecord
    belongs_to :student
    belongs_to :assignment
    has_one_attached :student_recording
    has_one_attached :student_notation
end
