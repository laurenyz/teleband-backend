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
