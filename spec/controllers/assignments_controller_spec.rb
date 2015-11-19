require 'rails_helper'
require 'spec_helper'
require 'assignments_controller'

describe AssignmentsController do
    describe 'assignments_home' do
        it 'sets @current_user when someone is logged in' do
        end
        it 'flashes "You need to be logged in to see this page" when someone is not logged in' do
        end
        it 'sets $course to the couse being passed in' do
        end
        it 'flashes "Please select a class to see this page" when a course is not correctly sent' do
        end
        it 'sets assignments variable when there is a course selected and a logged in user' do
        end
    end
    describe 'createAssignment' do
        it 'sets @current_user when someone is logged in' do
        end
        it 'creates a new assignment when the correct params are entered' do
        end
        it 'flashes "Unable to create assignment. There was no course for the assignment" when a course was not found' do
        end
        it 'flashes "Unable to create assignment. The name entered was not valid" when a name was not valid' do
        end
        it 'flashes "Unable to create assignment." if the database failed for some other reason' do
        end
        it 'flashes "Only Teachers can create Assignments" if some other user tries to create' do
        end
    end
    describe 'updateAssignment' do
        it 'sets @current_user when someone is logged in' do
        end
        it 'creates a new assignment when the correct params are entered' do
        end
        it 'flashes "Unable to update assignment. The assignment was not found" when an assignment was not found' do
        end
        it 'flashes "Unable to update assignment. The name entered was not valid" when a name was not valid' do
        end
        it 'flashes "Unable to update assignment." if the database failed for some other reason' do
        end
        it 'flashes "Only Teachers can update Assignments" if some other user tries to update' do
        end
    end
    describe 'deleteAssignment' do
        it 'sets @current_user when someone is logged in' do
        end
        it 'creates a new assignment when the correct params are entered' do
        end
        it 'flashes "Unable to delete assignment." if the database failed delete the record' do
        end
        it 'flashes "Only Teachers can create Assignments" if some other user tries to delete' do
        end
    end

    
end