class Teacher < ApplicationRecord
    has_many :teacher_courses
    has_many :courses, through: :teacher_courses
    has_secure_password

    def allStudentsData 
        totalStudents = []
        self.courses.each do |course|
            course.students.each do |student|
                totalStudents.push(student)
            end
        end
        studentData = totalStudents.uniq.map do |student|
            {"student": student, "assignments": student.assignmentsList}
        end
        return studentData
    end
end
