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
            #@fakeassignment = {assignment_id: "1", course_id: "2"}
            #@fakecourse = {id: "2", course_id: "2"}
        end
        it 'redirects to assignments home' do
            expect(Assignment).to receive(:find).and_return(false)
            get :index
            expect(response).to redirect_to(home_path)
            expect(flash[:notice]).to eq("Assignment does not exist!")
        end
        it 'goes to index page' do
            @fakea = FactoryGirl.create(:assignment)
            @fakec = FactoryGirl.create(:course)
            expect(Assignment).to receive(:find).and_return(@fakea).twice
            expect(Course).to receive(:find).and_return(@fakec)
            get :index
            expect(response).to render_template('index')
        end
    end
    describe 'create grades' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        it 'redirect if assignment does not exist' do
            expect(Assignment).to receive(:find).and_return(false)
            post :create, {:grade => {:grades => {"user" => "10"}}}
            expect(response).to redirect_to(home_path)
            expect(flash[:notice]).to eq("Assignment does not exist!")
        end    
        it 'add grade to page' do 
            @fakea = FactoryGirl.create(:assignment)
            @fakec = FactoryGirl.create(:course)
            expect(Assignment).to receive(:find).with(@fakea.id).and_return(@fakea)
            #Assignment.find("1")
            #post :create, {:grade => {:assignment_id => "1", :grades => {"admin" => "10"}}}
            #expect(response). to redirect_to()
            #expect(flash[:notice]).to eq("successfully added grade for ")
        end
    end
end