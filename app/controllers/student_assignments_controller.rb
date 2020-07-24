class StudentAssignmentsController < ApplicationController
    
    def index
        student_assignments = StudentAssignment.all
        render json: student_assignments
    end

    def show
        student_assignment = StudentAssignment.find(params[:id])
        assignment = student_assignment.assignment
        
        render json: {
            title: assignment.title,
            pdf_file: assignment.excerpts,
            assignment_audio_recordings: {
                assignment.title => assignment.audios
            },
            student_audio: student_assignment.student_audio
        }
    end
end
