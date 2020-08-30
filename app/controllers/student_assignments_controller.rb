class StudentAssignmentsController < ApplicationController
    
    def index
        student_assignments = StudentAssignment.all
        render json: student_assignments
    end

    def show
        student_assignment = StudentAssignment.find(params[:id])
        assignment = student_assignment.assignment
         if student_assignment.student_recording.attached?
             student_audio = url_for(student_assignment.student_recording)
         else
             student_audio = nil
         end
        
        render json: {
            title: assignment.title,
            pdf_file: assignment.excerpts,
            assignment_audio_recordings: {
                assignment.title => assignment.audios
            },
            student_audio: audio
        }
    end

    def attach_recording
        student_assignment = StudentAssignment.find(params[:id])
        r = student_assignment.student_recording.attach(params[:student_recording])
        url = rails_blob_url(r.first, only_path: true)
        render json: {
                message: "Attached to File", 
                url: url
        }
    end
end
