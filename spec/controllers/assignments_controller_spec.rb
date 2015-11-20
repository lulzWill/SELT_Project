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
        it 'renders the correct view with the correct post' do
            #pending "an announcement"
            post :assignments_home, {:courseId => @fakeCourse.id}
            expect(response).to render_template("assignments_home")
        end
        it 'sets $course to the course being passed in' do
            pending "an announcement"
            post :assignments_home, {:courseId => @fakeCourse.id}
            expect($course == @fakeCourse).to be true
        end
        it 'sets @current_user when someone is logged in'
        it 'flashes "You need to be logged in to see this page" when someone is not logged in' do
            pending "an announcement"
            post :assignments_home, {:courseId => @fakeCourse.id}
            expect(flash[:warning]).to eq "You need to be logged in to see this page" 
        end
        it 'flashes "Please select a class to see this page" when a course is not correctly sent' do
            pending "an announcement"
            post :assignments_home, {:courseId => ""}
            expect(flash[:warning]).to eq "Please select a class to see this page" 
        end
        it 'sets assignments variable when there is a course selected and a logged in user'
        it 'flashes "You do not have rights for this page" when not a teacher'
    end
    describe 'createAssignment' do
        it 'sets @current_user when someone is logged in'
        it 'creates a new assignment when the correct params are entered'
        it 'flashes "Unable to create assignment. There was no course for the assignment" when a course was not found'
        it 'flashes "Unable to create assignment. The name entered was not valid" when a name was not valid'
        it 'flashes "Unable to create assignment." if the database failed for some other reason'
        it 'flashes "Only Teachers can create Assignments" if some other user tries to create'
    end
    describe 'updateAssignment' do
        it 'sets @current_user when someone is logged in'
        it 'creates a new assignment when the correct params are entered'
        it 'flashes "Unable to update assignment. The assignment was not found" when an assignment was not found'
        it 'flashes "Unable to update assignment. The name entered was not valid" when a name was not valid'
        it 'flashes "Unable to update assignment." if the database failed for some other reason'
        it 'flashes "Only Teachers can update Assignments" if some other user tries to update'
    end
    describe 'deleteAssignment' do
        it 'sets @current_user when someone is logged in'
        it 'creates a new assignment when the correct params are entered'
        it 'flashes "Unable to delete assignment." if the database failed delete the record'
        it 'flashes "Only Teachers can create Assignments" if some other user tries to delete'
    end

    
end