class AssignmentsController < ApplicationController
    include Rails.application.routes.url_helpers

    def index 
        assignments = Assignment.all 
        render json: assignments
    end

    def show
        assignment = Assignment.find(params[:id])
        render json: assignment
    end

    def create
        assignment = Assignment.new(title: params[:title], instructions: params[:instructions], category: params[:formType], pdf_url:"", playing_sample_url:"", accompaniment_url:"") 
        if assignment.valid?
            assignment.save
            assignment.pdf.attach(params[:pdf])
            assignment.update(pdf_url: url_for(assignment.pdf))
            students = Student.all
            students.each do |student|
                StudentAssignment.create(student: student, assignment: assignment, student_audio:"", tone: nil, expression: nil, rhythm: nil)
            end
            render json: {
                    message: "Attached to File", 
                    assignment: assignment,
                    error: false
            }
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
