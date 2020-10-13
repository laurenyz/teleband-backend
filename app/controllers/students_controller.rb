class StudentsController < ApplicationController

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
                StudentAssignment.create(student: student, assignment: assignment, student_audio:"", tone: nil, expression: nil, rhythm: nil, student_response: "", student_notation_url: "")
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

    def profile 
        payload = request.headers["Authentication"]
        student = Student.find_by(school_id: payload)
    
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

end
