class Student < ApplicationRecord
    has_many :student_courses
    has_many :courses, through: :student_courses
    has_many :student_assignments
    has_many :assignments, through: :student_assignments

    def assignmentsList
        assignments = []
        self.student_assignments.each do |student_assignment|
            payload = {
                "title": student_assignment.assignment.title,
                "id": student_assignment.assignment.id,
                "student_assignment": student_assignment
            }
            assignments.push(payload)
        end
        return assignments
    end

end
