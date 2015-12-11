require 'rails_helper'
require 'spec_helper'
require 'users_controller'
require 'application_controller'
require 'sessions_controller'
require 'grades_controller'
require 'courses_controller'

RSpec.describe GradesController, type: :controller do
    describe 'go to assignments page for a nonexisting assignment' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        it 'redirects to assignments home' do
            expect(Assignment).to receive(:find).and_return(false)
            get :index
            expect(response).to redirect_to(assignments_home_path)
            expect(flash[:notice]).to eq("Assignment does not exist!")
        end
        it 'goes to index page' do
            @fakea = FactoryGirl.create(:assignment)
            @fakec = FactoryGirl.create(:course)
            expect(Assignment).to receive(:find).and_return(@fakea).twice
            
            expect(Course).to receive(:find).and_return(@fakec)
            gradesArray={"user0"=>"0","user1"=>"1","user2"=>"2","user3"=>"3","user4"=>"4","user5"=>"5","user6"=>"6","user7"=>"7","user8"=>"8","user9"=>"9","user10"=>"10"}
            expect(@fakea).to receive(:points).and_return(10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10)
            expect(@fakea).to receive(:grades).and_return(gradesArray)
            user = Array.new
            user << @current_user
            expect(@fakec).to receive(:users).and_return(user)
            get :index
            expect(response).to render_template('index')
        end
        it 'checks data displayed correctly' do
            @fakea = FactoryGirl.create(:assignment)
            @fakec = FactoryGirl.create(:course)
            expect(Assignment).to receive(:find).and_return(@fakea).twice
            
            expect(Course).to receive(:find).and_return(@fakec)
            gradesArray={}
            expect(@fakea).to receive(:grades).and_return(gradesArray)
            get :index
            expect(response).to render_template('index')
        end
    end
    describe 'create grades unsuccessfully' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
    end
    describe 'create grades successfully' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        it 'and pushes to table' do
            @fakea = FactoryGirl.create(:assignment)
            @fakec = FactoryGirl.create(:course)
            expect(Assignment).to receive(:find).and_return(@fakea).at_least(:once)
            assignment = Assignment.find(@fakea.id)
            expect(assignment).to receive(:update_attributes).and_return(true)
            assignment.update_attributes({:grade => {:grades => {"user" => "10"}}})
            post :create, {:grade => {:user_id => "admin", :points => "10"}}
            expect(flash[:notice]).to eq "successfully added grades!"
            expect(response).to redirect_to("///grades")
        end
    end
end