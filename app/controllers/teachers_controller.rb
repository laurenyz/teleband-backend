class TeachersController < ApplicationController

    def index
        teachers = Teacher.all
        render json: teachers
    end

    def show
        # insert decode method here
        id = decode(params[:id])

        teacher = Teacher.find(id)
        render json: teacher.to_json({
            :except => [:created_at, :updated_at],
            :include => 
                [:courses => {
                    :except => [:created_at, :updated_at],
                    :include => [:students => {
                        :except => [:created_at, :updated_at],
                        :include => [:student_assignments => {
                            :except => [:created_at]}]}]}]})
    end

    def profile 
        token = request.headers["Authentication"]
        payload = decode(token)
        teacher = Teacher.find(payload["teacher_id"])
        
        render json: {
            teacher: teacher,
            studentData: teacher.allStudentsData
        }
    end

    def create
        teacher = Teacher.new(name: params[:name], email: params[:email], password: params[:password])
        if teacher.valid?
            teacher.save
            render json: {
                    message: "Teacher successfully added", 
                    teacher: teacher,
                    error: false
            }
        else
            render json: {
                error: true,
                message: teacher.errors.full_messages
            }
        end
    end

    def update
        teacher = Teacher.find(params[:id])
        teacher.update(name: params[:name], email: params[:email])
        if params[:password] != ""
            teacher.update(password: params[:password])
        end
        if teacher.valid?
            render json: {
                    message: "Teacher information successfully updated.", 
                    teacher: teacher,
                    error: false
            }
        else
            render json: {
                error: true,
                message: teacher.errors.full_messages
            }
        end
    end
    
    # def updategrades
    #     token = request.headers["Authentication"]
    #     payload = decode(token)
    #     teacher = Teacher.find(payload["teacher_id"])

    #     assignments = params["updateAssignment"]
    #     assignments.each do |id, score|
    #         current = StudentAssignment.find(id)
    #         current.tone = score["tone"]
    #         current.expression = score["expression"]
    #         current.rhythm = score["rhythm"]
    #         current.submitted = true
    #         current.save
    #     end

    #     render json: {
    #         teacher: teacher,
    #         studentData: teacher.allStudentsData
    #     }
    # end

    def destroy
        teacher = Teacher.find(params[:id])
        teacher.destroy
        render json: {message: "Teacher account deleted."}
    end

   
#     {
#   [
#     {
#         student: [name],
#         studentID: [studentID],
#         classes: [class, class],
#         assignments: 
#         [
#            {
#               assignmentname: [name],
#               assignmentID: [ID],
#               status: [true/false],
#               grade: [1 -> 5 / null],
#               student_audio:
#             },
#             {
#               assignmentname: [name],
#               assignmentID: [ID],
#               status: [true/false],
#               tone: [1 -> 5 / null], 
#               expression:  [1 -> 5 / null], 
#               rhythm:  [1 -> 5 / null],
#               student_audio: [can be null or a link or the mp3 file]
#             },
#         ]
#      },      
#   ]
# }


end
