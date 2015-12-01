class GradesController < ApplicationController
    before_filter :set_current_user
    
    def new
    #render new template
    end
    
    def create
        if(Assignment.find(params[:assignment_id])) 
            assignment = Assignment.find(params[:assignment_id])
            
            grade_hash = Hash.new
            params[:grade].each do |user_id, points|
                grade_hash.merge!(user_id => points)
            end

            attributes_to_update = {:grades => assignment.grades.merge(grade_hash)}
            if assignment.update_attributes!(attributes_to_update)
                flash[:notice] = "successfully added grades!"
            else
                flash[:notice] = "Unable to add grades!"
            end
            redirect_to "/#{params[:course_id]}/#{params[:assignment_id]}/grades"
        else
            flash[:notice] = "Assignment does not exist!"
            redirect_to course_path
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
            
            @userlist = Array.new
            @course.users.each do |user|
                @userlist << {:id => user.user_id, :points => @grades[user.user_id]}
            end
        end
    end
end