class CoursesController < ApplicationController
    before_filter :set_current_user
    
    def course_params
        params.require(:course).permit(:name, :year_restrictions, :course_number, :description, :semester_hours)    
    end
    
    def new
    #render new template
    end
    
    def show
        id = params[:id]
        @course = Course.find(id)
        redirect_to assignments_home_path(courseId: @course.id), method: :post
    end
    
    def index
        @courses = Course.all
    end
    
    def create
        @course = Course.new(course_params)
        
        if @course.save
            flash[:notice] = "#{@course.name} was successfully created."
            redirect_to courses_path
        else
            flash[:notice] = "Sorry something went wrong, please try adding the course again."
            redirect_to new_course_path
        end
    end  
    
    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        flash[:notice] = "#{@course.name} was successfully deleted."
        redirect_to courses_path
    end
    
    def edit
       @course = Course.find(params[:id]) 
    end
    
    def update
       @course = Course.find(params[:id])
       @course.update_attributes!(course_params)
       flash[:notice] = "#{@course.name} was successfully updated."
       redirect_to assignments_home_path(courseId: @course.id), method: :post
    end    
end