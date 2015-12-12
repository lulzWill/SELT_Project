require "rails_helper"
require "spec_helper"
require "courses_controller"

describe CoursesController do 
    #before (:each) do 
       #@fakeadmin = FactoryGirl.create(:user, user_id:'admin', email:'admin@admin.com',password:'password',password_confirmation:'password',role: 'Admin')
        #@course = FactoryGirl(:invalid_course)
    #end 
    
    describe 'create' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        
        it 'adds course to table' do
           post :create, {:course => {:name => "10", :year_restrictions => 'freshman', :course_number => '5'}}
           expect(flash[:notice]).to eq "10 was successfully created."
           expect(response).to redirect_to(courses_path)
        end
        
        it 'redirects if unsuccessful' do
            post :create, {:course => {:name => "", :year_restrictions => 'freshman', :course_number => '5'}}
            expect(flash[:notice]).to eq "Sorry something went wrong, please try adding the course again."
            expect(response).to redirect_to(new_course_path)
        end    
    end 
    
    describe 'update' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
            
        end
        
        it 'successfully update a course' do
            @course = FactoryGirl.create(:course)
            #post :update, course_params: {:name => 'rename'}
            #post :update, {:id => 1, :name => 'rename', :year_restrictions => 'freshman', :course_number => '1', :description => 'Course', :semester_hours => 3}
            #post :update, @course => {id: 1, name: 'rename'}
            #post :update, id: @course.id, {course: course_params => {name:'rename', year_restrictions: 'freshman', course_number: '1', description: 'courses are fun', semester_hours: 3}}
            put :update, id: @course.id, course: FactoryGirl.attributes_for(:course)
            assigns(:course).should eq(@course)
            expect(flash[:notice]).to eq("Course1 was successfully updated.")
            expect(response).to redirect_to(assignments_home_path(courseId: @course.id))
        end 
    end
    
    describe 'show' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        
        it "assigns the requested course to @course" do
            @course = FactoryGirl.create(:course)
            get :show, {:id => @course.id}
            expect(assigns(:course)).to eq(@course)
        end    
    end
    
    describe 'delete course' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        
        it 'deletes a course' do
           @course = FactoryGirl.create(:course)
           post :destroy, {:id => @course.id}
           expect(Course.exists?(@course.id)).to be false
           expect(flash[:notice]).to eq "Course1 was successfully deleted."
           expect(response).to redirect_to courses_path
        end
    end
    
    describe 'new' do
        it 'tests new' do
            get :new
        end   
    end    
    
    describe 'index' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        
        it 'descibes course home' do
            get :index
            expect(response).to render_template('index')
        end    
    end
    
    describe 'edit' do
        it 'course edit' do
            @course = FactoryGirl.create(:course)
            get :edit, id: @course.id
        end    
    end
    
    describe 'enroll' do
        before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        
        it 'enrolls a user into a course' do
            #@fakeStudent = FactoryGirl.create(:user, user_id: 'student', email: 'student@student.com', password: 'student', password_confirmation: 'student', role: 'Student')
            @fakeCourse = FactoryGirl.create(:course)
            post :enroll, {:courseId => @fakeCourse.id}
            expect(@current_user.courses.include? @fakeCourse)
            expect(flash[:notice]).to eq("Enrolled in Course1") 
            expect(response).to redirect_to courses_path
        end   
    end    
end    