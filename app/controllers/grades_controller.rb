class GradesController < ApplicationController
    before_filter :set_current_user
    
    def new
    #render new template
    end
    
    def create
        if(Assignment.find(params[:grade][:assignment_id])) 
            assignment = Assignment.find(params[:grade][:assignment_id])
            attributes_to_update = {:grades => assignment.grades.merge(params[:grade][:assignment_id] => params[:grade][:points])}
            if assignment.update_attributes!(attributes_to_update)
                flash[:message] = "successfully added grade for " + params_hash[:grade][:user_id] + "!"
                #don't know where to redirect_to 
            else
                flash[:message] = "successfully added grade for " + params_hash[:grade][:user_id] + "!"
                #something went horribly wrong
            end
        else
            flash[:message] = "Assignment does not exist!"
            #don't know where to redirect_to
        end
    end
    
    def show
        
    end
    
    def index
        if(!Assignment.find(params[:assignment_id]))
            flash[:message] = "Assignment does not exist!"
            redirect_to assignments_home_path
        else
            @assignment = Assignment.find(params[:assignment_id])
            @course = Course.find(@assignment.course_id)
            @grades = @assignment.grades
        end
    end
end