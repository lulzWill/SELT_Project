require "rails_helper"
require "spec_helper"
require "courses_controller"

describe CoursesController do 
    #before (:all) do 
    #   @fakeadmin = FactoryGirl.create(:user, user_id:'admin', email:'admin@admin.com',password:'password',password_confirmation:'password',role: 'Admin')
    #end 
    
    describe 'create' do
        it 'creates a new course when the correct params are entered' do
            post :create, {:name => 'Intro to Things', :year_restrictions => 'none', :course_number => '7890'}
            expect(Course.where("name = ?", "Intro to Things")).to_not be_nil
        end
        
        it '"Sorry something went wrong, please try adding the course again." when a name was not valid' do
            post :create, {:name => '', :year_restrictions => '', :course_number => ''}
            expect(flash[:notice]).to eq "Sorry something went wrong, please try adding the course again."
        end
    end 
    
    describe 'update' do
        it 'creates a updated course when the correct params are entered' do
            post :update, {:id => 1,:name => "rename", :year_restrictions => 'none', :course_number => '1'}
            expect(Course.where("name = ?", "rename")).to_not be_nil
        end 
    end    
end    