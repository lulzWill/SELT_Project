class CoursesController < ApplicationController
    before_filter :set_current_user, :set_courses
    
    def course_params
        params.require(:course).permit(:name, :year_restrictions, :course_number, :description, :semester_hours)    
    end
    
    def new
    #render new template
    end
    
    def show
        @current_user = User.find_by_session_token(cookies[:session_token])
        id = params[:id]
        @course = Course.find(id)
        redirect_to assignments_home_path(courseId: @course.id), method: :post
    end
    
    def index
        @courses = Course.all

        if params[:search]
            @courses = Course.search(params[:search]).order("created_at DESC")
        else
            @courses = Course.all.order('created_at DESC')
        end
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
        if(@current_user.role == 'admin')
            @course = Course.find(params[:id])
        else
           flash[:warning] = "Only admins can do this!" 
        end    
    end
    
    def update
       @course = Course.find(params[:id])
       @course.update_attributes!(course_params)
       flash[:notice] = "#{@course.name} was successfully updated."
       redirect_to assignments_home_path(courseId: @course.id), method: :post
    end    
    
    def enroll
       course = Course.find(params[:courseId])
       @current_user.courses << course
       flash[:notice] = "Enrolled in #{Course.find(params[:courseId]).name}"
       redirect_to home_path
    end
end