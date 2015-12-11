require 'rails_helper'
require 'spec_helper'

describe 'Course' do 
    before(:each) do
        @course = Course.new
        @course.name = "valid"
    end
    
    it "should have valid factory" do
        FactoryGirl.build(:course).should be_valid
    end

    it "should require a name" do
        FactoryGirl.build(:course, :name => "").should_not be_valid
    end
    
    it "should require a year_restrictions" do
        FactoryGirl.build(:course, :year_restrictions => "").should_not be_valid
    end
    
    it "should require a course_number" do
        FactoryGirl.build(:course, :course_number => "").should_not be_valid
    end
    
    let(:course) {FactoryGirl.build(:course)}
    
    it "should have a unique name" do 
        old_course = FactoryGirl.create(:course)
        course.name = old_course.name
        course.should_not be_valid
    end   
    
    it "should have a unique course_number" do 
        old_course = FactoryGirl.create(:course)
        course.course_number = old_course.course_number
        course.should_not be_valid
    end 
    
    it 'should search' do
       search = FactoryGirl.create(:course)
       
       Course.search(search.name)
    end    
end    