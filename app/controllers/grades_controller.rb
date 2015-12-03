class GradesController < ApplicationController
    before_filter :set_current_user, :set_courses
    
    def new
    #render new template
    end
    
    def create
        if(Assignment.find(params[:assignment_id])) 
            assignment = Assignment.find(params[:assignment_id])
            attributes_to_update = {:grades => assignment.grades.merge(params[:grade][:user_id] => params[:grade][:points])}
            if assignment.update_attributes!(attributes_to_update)
                flash[:notice] = "successfully added grade for " + params[:grade][:user_id] + "!"
            else
                flash[:notice] = "successfully added grade for " + params[:grade][:user_id] + "!"
            end
            #redirect_to "/#{params[:course_id]}/#{params[:assignment_id]}/grades"
            redirect_to home_path
        else
            flash[:notice] = "Assignment does not exist!"
            redirect_to home_path
        end
    end
    
    def show
        
    end
    
    def index
        if(!Assignment.find(params[:assignment_id]))
            flash[:notice] = "Assignment does not exist!"
            redirect_to home_path
        else
            @assignment = Assignment.find(params[:assignment_id])
            @course = Course.find(@assignment.course_id)
            @grades = @assignment.grades
            
            @userlist = Array.new
            @course.users.each do |user|
            @userlist << user.user_id
            end
        end
    end
end