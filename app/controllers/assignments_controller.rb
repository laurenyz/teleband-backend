class AssignmentsController < ApplicationController
    def index 
        assignments = Assignment.all 
        render json: assignments
    end

    def show
        assignment = Assignment.find(params[:id])
        render json: assignment
    end
end
