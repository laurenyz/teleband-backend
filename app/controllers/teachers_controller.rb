class TeachersController < ApplicationController

    def index
        teachers = Teacher.all
        render json: teachers
    end

    def show
        teacher = Teacher.find(params[:id])
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

    # def profile
    #     token = request.headers["Authentication"]
    #     payload = decode(token)
    #     user = User.find(payload["user_id"])

    #     if user.scratchpads
    #         render json: {
    #             user: user,
    #             upvotes: user.upvotes.length,
    #             image_url: user.get_image_url(),
    #             scratchpads: user.user_scratchpads
    #             } 
    #     else
    #         render json: {
    #             user: user,
    #             upvotes: user.upvotes.length,
    #             image_url: user.get_image_url()
    #             } 
    #     end
    #end

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
