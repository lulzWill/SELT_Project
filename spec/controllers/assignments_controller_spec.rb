require 'rails_helper'
require 'spec_helper'
require 'assignments_controller'

describe AssignmentsController do
    before(:all) do
        @fakeCourse = FactoryGirl.create(:course)
        #@fakeTeacher = FactoryGirl.create(:user, role: 'Teacher')
        #fakeStudent = FactoryGirl.create(:user, role:'Student', user_id:'Student')
        @fakeAssignment = FactoryGirl.create(:assignment)
    end
    describe 'assignments_home' do
        describe 'no user logged on' do
            it 'flashes "You need to be logged in to see this page" when someone is not logged in' do
                post :assignments_home, {:courseId => @fakeCourse.id}
                expect(flash[:warning]).to eq "You need to be logged in to see this page" 
            end
        end
        describe 'Logged in as student' do
            it 'flashes "You do not have rights for this page" when not a teacher' do
                skip
                expect(flash[:warning]).to eq "You do not have rights for this page"
            end
        end
        describe 'Logged in as a teacher' do
            describe 'class not passed in' do
                it 'flashes "Please select a class to see this page" when a course is not correctly sent' do
                    skip
                    post :assignments_home, {:courseId => ""}
                    expect(flash[:warning]).to eq "Please select a class to see this page" 
                end
            end
            describe 'class passed in' do
                before(:each) do
                    post :assignments_home, {:courseId => @fakeCourse.id}
                end
                it 'renders the correct view with the correct post' do
                    #skip
                    #post :assignments_home, {:courseId => @fakeCourse.id}
                    expect(response).to render_template("assignments_home")
                end
                it 'sets $course to the course being passed in' do
                    #skip
                    #post :assignments_home, {:courseId => @fakeCourse.id}
                    expect($course == @fakeCourse).to be true
                end
                it 'sets @current_user to user logged in' do
                    skip
                    expect(@current_user == @fakeTeacher).to be true
                end
                it 'sets $assignments variable when there is a course selected and a logged in user' do
                    skip 
                    expect($course == @fakeCourse).to be true
                end
            end
        end
    end
    describe 'createAssignment' do
        describe 'Logged in as student' do
            it 'flashes "Only Teachers can create Assignments" if some other user tries to create' do
                skip
                post :assignments_home, {:name => @fakeAssignment.name, :points => fakeAssignment.points}
                expect(flash[:warning]).to eq "Only Teachers can create Assignments"
            end
        end
        describe 'Logged in as teacher' do
            #before(:all) do
             #       post :createAssignment, {:name => @fakeAssignment.name, :points => fakeAssignment.points}
            #end
            it 'sets @current_user to user logged in' do
                skip
                expect(@current_user == @fakeTeacher).to be true
            end
            it 'creates a new assignment when the correct params are entered' do
                skip
            end
            it 'flashes "Unable to create assignment. There was no course for the assignment" when a course was not found' do
                skip
                expect(flash[:warning]).to eq "Unable to create assignment. There was no course for the assignment"
            end
            it 'flashes "Unable to create assignment. The name entered was not valid" when a name was not valid' do
                skip
                expect(flash[:warning]).to eq "Unable to create assignment. The name entered was not valid"
            end
            it 'flashes "Unable to create assignment." if the database failed for some other reason' do
                skip
                expect(flash[:warning]).to eq "Unable to create assignment."
            end
        end
    end
    describe 'updateAssignment' do
        describe 'Logged in as student' do
            it 'flashes "Only Teachers can update Assignments" if some other user tries to update' do
                skip
                expect(flash[:warning]).to eq "Only Teachers can update Assignments"
            end
        end
        describe 'Logged in as teacher' do
            #before(:all) do
            #        post :updateAssignment, {:name => @fakeAssignment.name, :points => fakeAssignment.points}
            #end
            it 'sets @current_user to user logged in' do
                skip
                expect(@current_user == @fakeTeacher).to be true
            end
            it 'creates a new assignment when the correct params are entered' do
                skip
            end
            it 'flashes "Unable to update assignment. The assignment was not found" when an assignment was not found' do
                skip
                expect(flash[:warning]).to eq "Unable to update assignment. The assignment was not found"
            end
            it 'flashes "Unable to update assignment. The name entered was not valid" when a name was not valid' do
                skip
                expect(flash[:warning]).to eq "Unable to update assignment. The name entered was not valid"
            end
            it 'flashes "Unable to update assignment." if the database failed for some other reason' do
                skip
                expect(flash[:warning]).to eq "Unable to update assignment."
            end
        end
    end
    describe 'deleteAssignment' do
        describe 'Logged in as student' do
            it 'flashes "Only Teachers can create Assignments" if some other user tries to delete' do
                skip
                expect(flash[:warning]).to eq "Only Teachers can create Assignments"
            end
        end
        describe 'Logged in as teacher' do
            #before(:all) do
            #    post :deleteAssignment, {:name => @fakeAssignment.name, :points => fakeAssignment.points}
            #end
            it 'sets @current_user to user logged in' do
                skip
                expect(@current_user == @fakeTeacher).to be true
            end
            it 'creates a new assignment when the correct params are entered' do
                skip
            end
            it 'flashes "Unable to delete assignment." if the database failed delete the record' do
                skip
                expect(flash[:warning]).to eq "Unable to delete assignment."
            end
        end
    end

    
end