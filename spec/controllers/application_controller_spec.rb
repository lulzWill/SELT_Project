require 'rails_helper'
require 'spec_helper'
require 'users_controller'
require 'application_controller'
require 'users_controller'
require 'sessions_controller'

=begin
describe ApplicationController do
    describe 'set current user' do
        it 'sets the current user' do
            user = FactoryGirl.create(:user)
            @current_user = user
            @current_user.session_token="asdf"
            expect(User).to receive(:find_by_session_token).and_return(true)
            expect(@current_user).to_not be_nil
        end
       
        it 'redirects to login path if no session is found' do
            expect(@current_user).to be_nil
        end
    end
    describe 'check if logged in' do
        it 'user is logged in' do
            user = FactoryGirl.create(:user)
            user.session_token = "12354"
            expect(User).to receive(:find_by_session_token).and_return(true)
        end
        
        it 'user not logged in' do
            user = FactoryGirl.create(:user)
            expect(User).to receive(:find_by_session_token).and_return(false)
        end
    end
end
=end