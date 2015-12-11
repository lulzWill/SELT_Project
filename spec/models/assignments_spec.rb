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
        it "should return 0 if the points were nil" do
           expect(Assignment.validPoints(nil) == 0).to be true
        end   
    end
    describe 'validDueDate' do
        it "should return false if the date was nil" do
           expect(Assignment.validDueDate(nil)).to be false
        end
        it "should return true if the date was valid" do
           expect(Assignment.validDueDate("2015-12-23 00:00:00 UTC")).to be true
        end
    end
    describe 'createAssignment' do
        it "should create a new assignment if the params are valid" do
           expect(Assignment.createAssignment(@fakeCourse.id,"newAssignment", 5, nil,"2015-12-23 00:00:00 UTC").id).to_not be_nil
           expect(Assignment.where("name = ?", "newAssignment")).to_not be_nil
           
        end
        it "should not create a new assignment if the id is invalid" do
           Assignment.createAssignment(50,"newAssignment2", 5 ,nil ,"2015-12-23 00:00:00 UTC")
           expect(Assignment.where("name = ?", "newAssignment2").empty?).to be true
        end 
        it "should not create a new assignment if the name is invalid" do
           Assignment.createAssignment(@fakeCourse.id,"", 5, nil, "2015-12-23 00:00:00 UTC")
           expect(Assignment.where("name = ?", "").empty?).to be true
        end 
        it "should create a new assignment if the points are nil and everything is valid" do
           a = Assignment.createAssignment(@fakeCourse.id,"newAssignment3", nil, nil, "2015-12-23 00:00:00 UTC")
           expect(Assignment.find(a.id)).to_not be_nil
        end 
        it "should not create a new assignment if the date is nil"  do
           Assignment.createAssignment(@fakeCourse.id,"newAssignment4", nil, nil, nil)
           expect(Assignment.where("name = ?", "newAssignment4").empty?).to be true
        end 
    end
    describe 'updateAssignment' do
        it "should update an assignment if the params are valid" do
           expect(Assignment.updateAssignment(@fakeAssignment.id,"new Name", 5)).to be true
        end
        it "should not update an assignment if the assignment id is not valid" do
           expect(Assignment.updateAssignment(50,"newAssignment5", 5)).to eq("Unable to update assignment")
        end 
        it "should not update an assignment if the name is not valid" do
           expect(Assignment.updateAssignment(@fakeAssignment.id,"", 5)).to eq("Unable to update assignment. The name entered was not valid")
        end 
        #it "should not update an assignment if the date is nil" do
        #   expect(Assignment.updateAssignment(@fakeAssignment.id,"", 5, "2015-12-23 00:00:00 UTC")).to be "Unable to create assignment. The dueDate was not valid"
        #end 
    end
   
end