class AssignmentsController < ApplicationController
    def index 
        assignments = Assignment.all 
        render json: assignments
    end

    def show
        assignment = Assignment.find(params[:id])
        render json: assignment
    end

    def create
        assignment = Assignment.new(title: params[:title], excerpts:"", audios:"")  
        if assignment.valid?
            assignment.save
            students = Student.all
            students.each do |student|
                StudentAssignment.create(student: student, assignment: assignment, student_audio:"", tone: nil, expression: nil, rhythm: nil)
            end
            render json: assignment
        else
            render json: {
                error: true,
                message: assignment.errors.full_messages
            }
        end
    end

    def destroy
        assignment = Assignment.find(params[:id])
        assignment.destroy

        render json: {message: "assignment deleted"}
    end
end
