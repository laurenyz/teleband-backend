class Teacher < ApplicationRecord
    has_many :students
    has_secure_password

    def allStudentsData
        studentData = self.students.uniq.map do |student|
            {"student": student, "assignments": student.assignmentsList}
        end
        return studentData
    end

    # def allStudentsData 
    #     totalStudents = []
    #     self.courses.each do |course|
    #         course.students.each do |student|
    #             totalStudents.push(student)
    #         end
    #     end
    #     studentData = totalStudents.uniq.map do |student|
    #         {"student": student, "assignments": student.assignmentsList}
    #     end
    #     return studentData
    # end
end
