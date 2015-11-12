class CoursesController < ApplicationController
    before_filter :set_current_user
    
    def course_params
        params.require(:course).permit(:name, :description, :course_number, :semester_hours)    
    end
    
    def new
    #render new template
    end
    
    def show
    
    end
    
    def index
        
    end
    
    def create
        @course = Course.create!(course_params)
        flash[:notice] = "#{@course.name} was successfully created."
        redirect_to new_courses_path 
    end  
    
    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        flash[:notice] = "#{@course.name} was successfully deleted."
        redirect_to courses_path
    end
end