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
            student_audio: student_audio
        }
    end

    def attach_recording
        student = Student.find_by(school_id: params[:school_id])
        student_assignment = StudentAssignment.find_by(student_id: student.id, assignment_id: params[:assignment_id])
        r = student_assignment.student_recording.attach(params[:student_recording])
        url = rails_blob_url(r.first, only_path: true)
        render json: {
                message: "Attached to File", 
                url: url
        }
    end
end
