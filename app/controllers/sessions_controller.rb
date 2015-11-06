class SessionsController < ApplicationController
    
    def session_params
        params.require(:user).permit(:user_id, :password, :session_token)
    end
  
    def new
        # default, display new.html
    end
    
    def create
        user = User.find_by_user_id(session_params[:user_id])
        check = user && user.authenticate(session_params[:password]) 
        if check
            cookies.permanent[:session_token]= user.session_token
            redirect_to "/user/show.html.haml"
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