class SessionsController < ApplicationController
    skip_before_filter :set_current_user
    
    def new
        # default, display new.html
    end
    
    def create
        user = User.find_by_user_id(params[:session][:user_id])
        check = user && user.authenticate(params[:session][:password])
        if check
            #flash[:notice] = "Logged in as #{params[:session][:user_id]}"
            cookies.permanent[:session_token]=user.session_token
            
            if user.role == 'admin'
                redirect_to courses_path 
            end
            
            if user.role == 'Student'
                redirect_to login_path
            end    
            #redirect_to profile_path
            
            if user.role == 'Teacher'
               redirect_to login_path
            end    
        else
            flash[:notice] = "Invalid User-ID/Password combination"
            redirect_to login_path
        end
    end
    
    def destroy
        cookies.delete(:session_token) 
        @current_user=nil
        flash[:notice]= 'You have logged out'
        redirect_to login_path
    end
end