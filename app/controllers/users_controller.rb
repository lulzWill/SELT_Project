class UsersController < ApplicationController
    
    before_filter :set_current_user, :only=> ['show', 'edit', 'update', 'delete']
    def user_params
     params.require(:user).permit(:email, :user_id, :role, :password)
    end
    
    def new
    #render new template
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def create
        if(!User.find_by_user_id(params[:user][:user_id]))
            params_hash = {:email => params[:user][:email], :user_id => params[:user][:user_id], :role => params[:user][:role], :password => params[:user][:password]} 
            @user = User.new(params_hash)
            if @user.save
                #UserMailer.welcome_email(@user).deliver_now
                flash[:notice] = "You have successfully signed up as a #{params[:user][:role]}"
                redirect_to login_path
            else
                flash[:notice] = "Sorry, something went wrong. Please try again"
                redirect_to new_user_path
            end
        else
            flash[:notice] = "Sorry, but that user id is already taken"
            redirect_to new_user_path
        end
    end
    
    def admin_home 
        #render page
    end
    
    def admin_view_professors
        if @current_user.role == "Admin"
            @professors = User.where(:role => "Professor")
        else
            flash[:notice] = "You are not authorized to view this"
            redirect_to home_path
        end
    end
    
    def view_students
        if @current_user.role == "Professor"
           @students = nil
        elsif @current_user.role == "Admin"
            @students = User.where(:role => "Student")
        else
            flash[:notice] = "You are not authorized to view students"
            redirect_to home_path
        end
    end
    
    def home
        @user = User.find_by_session_token(cookies[:session_token])
        
        @courses = Course.all
        @studens = User.all
    end
    
    def promote_TA
        User.update!(params[:id], :ta => true)
        redirect_to view_students_path
    end
    
    def demote_TA
        User.update!(params[:id], :ta => false)
        redirect_to view_students_path
    end
    
end