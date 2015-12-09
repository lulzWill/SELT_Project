class SessionsController < ApplicationController
    skip_before_filter :set_current_user
    
    def new
        if logged_in?
            flash[:notice]="You are already logged in"
            redirect_to home_path
        end
        # default, display new.html
    end
    
    def create
        user = User.find_by_user_id(params[:session][:user_id])
        check = user && user.authenticate(params[:session][:password])
        if check
            user.session_token = SecureRandom.urlsafe_base64
            user.save!
            #flash[:notice] = "Logged in as #{params[:session][:user_id]}"
            cookies.permanent[:session_token]=user.session_token
            if user.role == "Admin"
                redirect_to admin_home_path
            else
                redirect_to home_path
            end
            flash[:notice] = "You have successfully logged in as #{params[:session][:user_id]}"
        else
            flash[:warning] = "Invalid User-ID/Password combination"
            redirect_to new_user_path
        end
    end
    
    def destroy
        cookies.delete(:session_token) 
        @current_user=nil
        flash[:notice]= 'You have logged out'
        redirect_to new_user_path
    end
end