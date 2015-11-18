class AssignmentsController < ApplicationController
    
    #when professor assignments page renders
    def assignments_home
        @current_user = User.find_by_session_token(cookies[:session_token])
        #@course = Course.find(params[:courseId])
        @course = Course.find(1)
        @assignments = Assignment.where("course_id = ?", @course.id)
        
        if(!@current_user)
            flash[:notice] = "You need to be logged in to see this page"
        end
        if(!@course)
            flash[:notice] = "Please select a class to see this page"
        end
    end
    
    #for creating a new assignments
    def createAssignment
        redirect_to assignments_home_path
        #if(@current_user.role == "Teacher")
            result = Assignment.createAssignment(1, params[:name], params[:points])
            #redirect_to assignments_home_path
            result = 1
            if(result.is_a? String)
                flash[:warning] = result
            elsif(result == false)
                flash[:warning] = "Unable to create assignment"
            end
        #else
            #redirect_to assignments_home_path
            #flash[:warning] = "Only Teachers can create Assignments"
        #end
    end
    
    def updateAssignment
        if(@current_user.role == "Teacher")
            result = Assignment.updateAssignment(params[:assignmentID], params[:name], params[:points])
            redirect_to assignments_home_path
            if(result.is_a? String)
                flash[:warning] = result
            elsif(result == false)
                flash[:warning] = "Unable to create assignment"
            end
        else
            redirect_to assignments_home_path
            flash[:warning] = "Only Teachers can create Assignments"
        end
    end
end