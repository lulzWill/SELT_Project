require 'rails_helper'
require 'spec_helper'
require 'users_controller'
require 'application_controller'
require 'users_controller'
require 'sessions_controller'


describe ApplicationController do
    describe 'set current user' do
        it 'sets the current user' do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            expect(User).to receive(:find_by_session_token).with(cookies[:session_token]).and_return(true)
            User.find_by_session_token(cookies[:session_token])
            expect(@current_user).to_not be_nil
        end
       
        it 'redirects to login path if no session is found' do
            expect(User).to receive(:find_by_session_token).with('').and_return(false)
            User.find_by_session_token('')
            expect(@current_user).to be_nil
        end
    end
    describe 'check if logged in' do
        it 'user is logged in' do
            @current_user = FactoryGirl.create(:user)
            @current_user.session_token = SecureRandom.urlsafe_base64
            cookies.permanent[:session_token] = @current_user.session_token
            #@session = User.find_by_session_token(cookies[:session_token])
            expect(cookies[:session_token]).to_not be_nil
        end
        
        it 'user not logged in' do
            @current_user = FactoryGirl.create(:user)
            @session = User.find_by_session_token(nil)
            expect(controller.logged_in?).to be false
        end
    end
end