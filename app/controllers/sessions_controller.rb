class SessionsController < ApplicationController
    def user_params
     params.require(:user).permit(:email, :user_id)
    end
    
    def new
    end
    
    def create
        user = User.find_by_user_id(params[:user][:user_id])
        if(!user || !params[:user][:email].eql?(user[:email]))
            flash[:notice] = "Username or email was incorrect. Please try again"
            redirect_to login_path
        else
            session[:session_token] = user.session_token
            redirect_to movies_path
        end
    end
    
    def destroy
        session.delete(:session_token)
        redirect_to movies_path
    end
end