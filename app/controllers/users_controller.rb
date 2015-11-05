class UsersController < ApplicationController
    def user_params
     params.require(:user).permit(:email, :user_id, :position, :password, :password_conf)
    end
    
    def new
    #render new template
    end
    
    def create
        if(!User.find_by_user_id(params[:user][:user_id]))
            @user = User.create_user!(user_params)
            flash[:notice] = "You have successfully signed up as a #{@user.position}"
            redirect_to login_path
        else
            flash[:notice] = "Sorry, but that user id is already taken"
            redirect_to new_user_path
        end
    end
end