class StudentAssignmentsController < ApplicationController
    
    def index
        student_assignments = StudentAssignment.all
        render json: student_assignments
    end

    def show
        student_assignment = StudentAssignment.find(params[:id])
        assignment = student_assignment.assignment
        student = student_assignment.student
         if student_assignment.student_recording.attached?
             student_audio = url_for(student_assignment.student_recording)
         else
             student_audio = nil
         end
        
        render json: {
            title: assignment.title,
            student: student.name,
            pdf_file: assignment.excerpts,
            submitted: student_assignment.submitted,
            assignment_audio_recordings: {
                assignment.title => assignment.audios
            },
            student_audio: student_audio
        }
    end

    def attach_notation
        student = Student.find_by(school_id: params[:school_id])
        student_assignment = StudentAssignment.find_by(student_id: student.id, assignment_id: params[:assignment_id])
        student_assignment.student_notation.attach(params[:student_notation])
        student_assignment.update(student_notation_url: url_for(student_assignment.student_notation))
        if student_assignment.student_notation.attached?
            render json: {
                    message: "Attached successfully", 
                    student_assignment: student_assignment,
                    error: false
            }
        else 
            render json: {
                error: true,
                message: "Notation could not be uploaded, please try again."
            }
        end
    end

    def attach_response
        student = Student.find_by(school_id: params[:school_id])
        student_assignment = StudentAssignment.find_by(student_id: student.id, assignment_id: params[:assignment_id])
        student_assignment.update(student_response: params[:student_response], rhythm: params[:rhythm], tone: params[:tone], expression: params[:expression], submitted: true)
        render json: {
                    message: "Successfully uploaded", 
                    student_assignment: student_assignment,
                    error: false
            }
    end

    def attach_recording
        student = Student.find_by(school_id: params[:school_id])
        student_assignment = StudentAssignment.find_by(student_id: student.id, assignment_id: params[:assignment_id])
        student_assignment.student_recording.attach(params[:student_recording])
        student_assignment.update(submitted: true, student_audio: url_for(student_assignment.student_recording))
        if student_assignment.student_recording.attached?
            render json: {
                    message: "Attached successfully", 
                    student_assignment: student_assignment,
                    error: false
            }
        else 
            render json: {
                error: true,
                message: "Audio could not upload, please try again."
            }
        end
    end
end
