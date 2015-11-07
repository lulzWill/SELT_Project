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
                #UserMailer.welcome_email(@user).deliver
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
end