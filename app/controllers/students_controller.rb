class StudentsController < ApplicationController
    require 'csv'

    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find(params[:id])
        render json: student.to_json(
            :except => [:created_at, :updated_at],
            :include => [:student_assignments => 
            {:except => 
            [:created_at, :updated_at, :audios],
            :include => 
            [:assignment => 
            {:except =>[ :created_at, :updated_at] 
            }]}]
        )
    end

    def create
        student = Student.new(school_id: params[:school_id], teacher_id: params[:teacher_id], name: params[:name], grade: params[:grade], classes: "")
        if student.valid?
            student.save
            assignments = Assignment.all
            assignments.each do |assignment|
                StudentAssignment.create(student: student, assignment: assignment, student_audio:"", student_response: "", student_notation_url: "")
            end
            render json: {
                message: "Student successfully added", 
                studentData: {"student": student, "assignments": student.assignmentsList},
                error: false
            }
        else
            render json: {
                error: true,
                message: student.errors.full_messages
            }
        end
    end

    def import_classlist
        teacher_id = params[:teacher_id]
        csv_file = params[:csv].tempfile
        new_students = CSV.read(csv_file)
        addedStudents = new_students.map do |student|
            student = Student.new(school_id: "", teacher_id: params[:teacher_id], name: student[0], grade: student[1], classes: "")
            student.update(school_id: student.getRandomId)
            if student.valid?
                student.save
                assignments = Assignment.all
                assignments.each do |assignment|
                    StudentAssignment.create(student: student, assignment: assignment, student_audio:"", student_response: "", student_notation_url: "")
                end
                student
            else
                return render json: {
                    error: true,
                    message: "There was an error with the upload. Please make sure the CSV is in the correct format."
                } 
            end
        end
        studentData = addedStudents.map do |student|
            {"student": student, "assignments": student.assignmentsList}
        end
        render json: {
                message: "Students successfully added", 
                studentData: studentData,
                error: false
            }
    end

    def update
        student = Student.find(params[:id])
        student.update(name: params[:name], grade: params[:grade])
        if student.valid?
            render json: {
                    message: "Student information successfully updated.", 
                    studentData: {"student": student, "assignments": student.assignmentsList},
                    error: false
            }
        else
            render json: {
                error: true,
                message: student.errors.full_messages
            }
        end
    end

    def profile 
        payload = request.headers["Authentication"]
        student = Student.find_by(school_id: payload)
    
        render json: student.to_json(
            :except => [:created_at, :updated_at],
            :include => [:student_assignments => 
            {:except => 
            [:created_at, :updated_at],
            :include => 
            [:assignment => 
            {:except =>[ :created_at, :updated_at] 
            }]}]
        )
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: {message: "Student account deleted."}
    end

end
