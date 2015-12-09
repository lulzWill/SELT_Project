require 'rails_helper'
require 'spec_helper'

describe 'Assignment' do
    before(:each) do
        @fakeCourse = FactoryGirl.create(:course, :name => 'Course2', :year_restrictions => 'none', :course_number => '2')
        @fakeAssignment = FactoryGirl.create(:assignment)
    end
    describe 'validAssignment' do
        it "should return true if the assignment exists" do
           expect(Assignment.validAssignment(@fakeAssignment.id)).to be true
        end
        it "should return false if the assignment does not exist" do
           expect(Assignment.validAssignment(50)).to be false
        end
    end
    describe 'validCourse' do
        it "should return true if the course exists" do
           expect(Assignment.validCourse(@fakeCourse.id)).to be true
        end
        it "should return false if the course does not exist" do
           expect(Assignment.validCourse(50)).to be false
        end
    end
    
    describe 'validName' do
        it "should return true if the name is valid" do
           expect(Assignment.validName("Assignment")).to be true
        end
        it "should return false if the name is invalid" do
           expect(Assignment.validName("")).to be false
        end       
    end
    describe 'validPoints' do
        it "should return the points if they are valid" do
           expect(Assignment.validPoints(50) == 50).to be true
        end
        it "should return 0 if it was a string" do
           expect(Assignment.validPoints('50') == 50).to be true
        end
        it "should return 0 if the points were invalid" do
           expect(Assignment.validPoints('') == 0).to be true
        end   
    end
    describe 'createAssignment' do
        it "should create a new assignment if the params are valid" do
           Assignment.createAssignment(1,"newAssignment", 5)
           expect(Assignment.where("name = ?", "newAssignment")).to_not be_nil
        end
        it "should not create a new assignment if the id is invalid" do
           Assignment.createAssignment(50,"newAssignment2", 5)
           expect(Assignment.where("name = ?", "newAssignment2").empty?).to be true
        end 
        it "should not create a new assignment if the name is invalid" do
           Assignment.createAssignment(1,"", 5)
           expect(Assignment.where("name = ?", "").empty?).to be true
        end 
    end
    describe 'updateAssignment' do
        it "should update an assignment if the params are valid" do
           Assignment.createAssignment(1,"new Name", 5)
           expect(Assignment.where("name = ?", "newAssignment")).to_not be_nil
        end
        it "should not update an assignment if the assignment is not valid" do
           Assignment.createAssignment(50,"newAssignment3", 5)
           expect(Assignment.where("name = ?", "newAssignment3").empty?).to be true
        end 
        it "should not update an assignment if the name is not valid" do
           Assignment.createAssignment(1,"", 5)
           expect(Assignment.where("name = ?", "").empty?).to be true           
        end 
    end
   
end