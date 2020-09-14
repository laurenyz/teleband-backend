class Assignment < ApplicationRecord
    has_many :student_assignments, :dependent => :delete_all
    has_many :students, through: :student_assignments
end
