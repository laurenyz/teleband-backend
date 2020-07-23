class Assignment < ApplicationRecord
    has_many :student_assignments
    has_many :students, through: :student_assignments
end
