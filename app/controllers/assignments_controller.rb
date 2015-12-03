class AssignmentsController < ApplicationController
    before_filter :set_current_user, :only=> ['show', 'edit', 'update', 'delete']
    #when professor assignments page renders
    def assignments_home
        @current_user = User.find_by_session_token(cookies[:session_token])
        if(params[:courseId] != nil)
            if(Course.exists?(params[:courseId]))
                $course = Course.find(params[:courseId])
            else
                $course = nil
            end
            
        end
        if($course != nil && Assignment.exists?(:course_id => $course.id))
            $assignments = Assignment.where("course_id = ?", $course.id)
        else
            $assignments = nil
        end#$course = Course.find(1)
        
        if(!@current_user)
            flash[:warning] = "You need to be logged in to see this page"
            $course = nil
            $assignments = nil
        elsif(@current_user.role != "Teacher")
            flash[:warning] = "You do not have rights for this page"
        elsif(!$course || $course == [])
            flash[:warning] = "Please select a class to see this page"
        end
        
    end
    
    #for creating a new assignments
    def createAssignment
        @current_user = User.find_by_session_token(cookies[:session_token])
        if(@current_user.role == "Teacher" && $course != nil && $course != [])
            result = Assignment.createAssignment($course.id, params[:name], params[:points], params[:file])
            if(result.is_a? String)
                flash[:warning] = result
            elsif(result == false)
                flash[:warning] = "Unable to create assignment"
            end
        else($course == nil && $course == [])
            flash[:warning] = "Unable to create assignment"
        end
        redirect_to assignments_home_path
    end
    
    def updateAssignment
        @current_user = User.find_by_session_token(cookies[:session_token])
        if(@current_user.role == "Teacher")
            result = Assignment.updateAssignment(params[:assignmentID].to_i, params[:name], params[:points], params[:file])
            if(result.is_a? String)
                flash[:warning] = result
            elsif(result == false)
                flash[:warning] = "Unable to update assignment"
            end
        end
        redirect_to assignments_home_path
    end
    
    def deleteAssignment
        @current_user = User.find_by_session_token(cookies[:session_token])
        if(@current_user.role == "Teacher")
            if(params[:assignmentID] == nil)
            end
            if(Assignment.exists?(params[:assignmentID]))
                Assignment.find(params[:assignmentID]).destroy
            else
                flash[:warning] = "Unable to delete assignment"
            end
        end
        redirect_to assignments_home_path
    end
end