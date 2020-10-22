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
            if assignment.category != 'response'
                assignment.accompaniment.attach(params[:accompaniment])
                assignment.playing_sample.attach(params[:playing_sample])
                assignment.update(pdf_url: url_for(assignment.pdf), accompaniment_url: url_for(assignment.accompaniment), playing_sample_url: url_for(assignment.playing_sample))
            else 
                assignment.update(pdf_url: url_for(assignment.pdf))
            end
            students = Student.all
            students.each do |student|
                StudentAssignment.create(student: student, assignment: assignment, student_audio:"", student_response: "", student_notation_url: "")
            end
            render json: {
                    message: "Assignment Successfully Created", 
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

    def update
        assignment = Assignment.find(params[:id])
        assignment.update(title: params[:title], instructions: params[:instructions], category: params[:formType])
        if params[:pdf] != "null"
        assignment.pdf.attach(params[:pdf])
        assignment.update(pdf_url: url_for(assignment.pdf))
        end
        if assignment.category != 'response'
            if params[:accompaniment] != "null"
            assignment.accompaniment.attach(params[:accompaniment])
            assignment.update(accompaniment_url: url_for(assignment.accompaniment))
            end
            if params[:playing_sample] != "null"
            assignment.playing_sample.attach(params[:playing_sample])
            assignment.update(playing_sample_url: url_for(assignment.playing_sample))
            end
        end
        if assignment.valid?
            render json: {
                    message: "Assignment Successfully Updated", 
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
