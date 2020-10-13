class AuthController < ApplicationController

    def create 
        if params["school_id"]
            student = Student.find_by(school_id: params["school_id"])
            if student
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
            else
                render json: {
                error: true,
                message: "Student does not exist"
            }
            end
        else
            teacher = Teacher.find_by(email: params["email"])
            if teacher && teacher.authenticate(params["password"])
                payload = {teacher_id: teacher.id}
                token = encode(payload)
                render json: {
                    teacher: teacher,
                    studentData: teacher.allStudentsData,
                    error: false,
                    token: token
                }
            else
                render json: {
                error: true,
                message: "Incorrect username/password combination."
            }
            end
        end
    end

end