class StudentsController < ApplicationController

    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find(params[:id])
        render json: student.to_json(
            :except => [:created_at, :updated_at],
            :include => [:assignments => {:except => [:created_at, :updated_at, :excerpts, :audios],:include => [:student_assignments => {:except =>[ :created_at, :updated_at, :tone, :rhythm, :expression, :student_id, :assignment_id] }]}]
        )
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
end
