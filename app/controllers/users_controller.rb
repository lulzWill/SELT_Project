class UsersController < ApplicationController
    def user_params
     params.require(:user).permit(:email, :user_id, :role, :password)
    end
    
    def new
    #render new template
    end
    
    def create
        if(!User.find_by_user_id(params[:user][:user_id]))
            @user = User.new(user_params)
            if @user.save
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
    
    def index
        
    end
    
    def login
        
    end
end