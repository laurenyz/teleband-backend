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

        # render json: {
        #     assignments: student.assignments,
        #     student_assignments: student.student_assignments,
        #     student:

        # }



        # Should return
        # {
        #     [
        #        {
        #           assignment_name: “variation on a shaker medley, excerpt 1”,
        #           submitted: true,
        #           :student_assignmentId
        #         },
        #        {
        #           assignment_name: “variation on a shaker medley, excerpt 2”,
        #           submitted: false,
        #           :student_assignmentId
        #         }
        #     ]
        #  }
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
    # end
end
