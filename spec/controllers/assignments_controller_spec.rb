require 'rails_helper'
require 'spec_helper'
require 'assignments_controller'

describe AssignmentsController do
    before(:all) do
        @fakeCourse = FactoryGirl.create(:course)
        @fakeTeacher = FactoryGirl.create(:user, user_id:'teacher', email:'teacher@teacher.com',password:'teacher',password_confirmation:'teacher',role: 'Teacher')
        @fakeStudent = FactoryGirl.create(:user, user_id:'student', email:'student@student.com',password:'student',password_confirmation:'student',role: 'Student')
        @fakeAssignment = FactoryGirl.create(:assignment)
    end
    describe 'assignments_home' do
        describe 'no user logged on' do
            before(:each) do
                cookies.permanent[:session_token] = nil
            end
            it 'flashes "You need to be logged in to see this page" when someone is not logged in' do
                post :assignments_home, {:courseId => @fakeCourse.id}
                expect(flash[:warning]).to eq "You need to be logged in to see this page" 
            end
        end
        describe 'Logged in as student' do
            before(:each) do
                cookies.permanent[:session_token] = @fakeStudent.session_token
            end
            it 'flashes "You do not have rights for this page" when not a teacher' do
                post :assignments_home, {:courseId => @fakeCourse.id}
                expect(flash[:warning]).to eq "You do not have rights for this page"
            end
        end
        describe 'Logged in as a teacher' do
            describe 'class not specified' do
                before(:each) do
                    cookies.permanent[:session_token] = @fakeTeacher.session_token
                end
                it 'flashes "Please select a class to see this page" when a course is not correctly sent' do
                    post :assignments_home, {:courseId => ""}
                    expect(flash[:warning]).to eq "Please select a class to see this page"
                end
            end
            describe 'class was specified' do
                before(:each) do
                    cookies.permanent[:session_token] = @fakeTeacher.session_token
                    post :assignments_home, {:courseId => @fakeCourse.id}
                end
                it 'renders the correct view with the correct post' do
                    expect(response).to render_template("assignments_home")
                end
                it 'sets $course to the course being passed in' do
                    expect($course == @fakeCourse).to be true
                end
                it 'sets @current_user to user logged in' do
                    expect(assigns(:current_user)).to eq @fakeTeacher
                end
                it 'sets $assignments variable when there is a course selected and a logged in user' do
                    expect($course == @fakeCourse).to be true
                end
            end
        end
    end
    describe 'createAssignment' do
        describe 'Logged in as teacher' do
            before(:each) do
                cookies.permanent[:session_token] = @fakeTeacher.session_token
            end
            it 'sets @current_user to user logged in' do
                post :createAssignment, {:name => "Assignment2", :points => 30}
                expect(assigns(:current_user)).to eq @fakeTeacher
            end
            it 'creates a new assignment when the correct params are entered' do
                post :createAssignment, {:name => "Assignment3", :points => 40}
                expect(Assignment.where("name = ?", "Assignment3")).to_not be_nil
            end
            it 'flashes "Unable to create assignment. The name entered was not valid" when a name was not valid' do
                post :createAssignment, {:name => "", :points => 50}
                expect(flash[:warning]).to eq "Unable to create assignment. The name entered was not valid"
            end
            it 'flashes "Unable to create assignment. There was no course for the assignment" when a course was not found' do
                $course = nil
                post :createAssignment, {:name => "name", :points => 10}
                expect(flash[:warning]).to eq "Unable to create assignment"
            end
        end
    end
    describe 'updateAssignment' do
        describe 'Logged in as teacher' do
            before(:each) do
                cookies.permanent[:session_token] = @fakeTeacher.session_token
            end
            it 'sets @current_user to user logged in' do
                post :updateAssignment, {:assignmentId => 1,:name => "rename1", :points => 10}
                expect(assigns(:current_user)).to eq @fakeTeacher
            end
            it 'creates a new assignment when the correct params are entered' do
                post :updateAssignment, {:id => 1,:name => "rename2", :points => 10}
                expect(Assignment.where("name = ?", "rename2")).to_not be_nil
            end
        end
    end
    describe 'deleteAssignment' do
        describe 'Logged in as teacher' do
            before(:each) do
                cookies.permanent[:session_token] = @fakeTeacher.session_token
            end
            it 'sets @current_user to user logged in' do
                post :deleteAssignment, {:assignmentId => 2}
                expect(assigns(:current_user)).to eq @fakeTeacher
            end
            it 'deletes assignment when the correct params are entered' do
                post :deleteAssignment, {:assignmentID => 1}
                expect(Assignment.exists?(1)).to be false
            end
        end
    end

    
end