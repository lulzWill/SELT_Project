require 'rails_helper'
require 'spec_helper'

describe UsersController do
  describe 'creating a User' do
    it 'should call the model method to make a new user and the method model to save a new user and redirect to login when successful' do
      expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)
      
      fakeUser = double("user");
      
      expect(User).to receive(:new).and_return(fakeUser)
      expect(fakeUser).to receive(:save).and_return(true)
      
      post :create, {:user => {:email => "fake@fake.com", :user_id => "fakeid", :role => "Student", :password => "fakepass"}}
      expect(assigns(:user)).to eq fakeUser
      expect(response).to redirect_to(login_path)
      expect(flash[:notice]).to eq("You have successfully signed up as a Student")
    end
    
    it 'should redirect to sign up page if there is an error creating the user' do
      expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)

      fakeUser = double("user");
      
      expect(User).to receive(:new).and_return(fakeUser)
      expect(fakeUser).to receive(:save).and_return(false)
      
      post :create, {:user => {:email => "fake@fake.com", :user_id => "fakeid", :role => "Student", :password => "fakepass"}}
      expect(assigns(:user)).to eq fakeUser
      expect(response).to redirect_to(new_user_path)
      expect(flash[:notice]).to eq("Sorry, something went wrong. Please try again")
    end
    
    it 'should redirect to sign up page if the user already exists in the database' do
      expect(User).to receive(:find_by_user_id).with('fakeid').and_return(true)
      
      post :create, {:user => {:email => "fake@fake.com", :user_id => "fakeid", :role => "Student", :password => "fakepass"}}
      expect(response).to redirect_to(new_user_path)
      expect(flash[:notice]).to eq("Sorry, but that user id is already taken")
    end
  end
  
   describe 'admin_view_professors' do
    describe 'user is an admin' do
      before :each do
            @current_user = FactoryGirl.create(:user, user_id:'admin', email:'admin@admin.com',password:'admin',password_confirmation:'admin',role: 'Admin')
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        it 'should view teachers' do
          get :admin_view_professors
        end
    end
    describe 'user is not an admin' do
      before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        it 'should deny access' do
          get :admin_view_professors
          expect(flash[:notice]).to eq("You are not authorized to view this")
          expect(response).to redirect_to(home_path)
        end
    end
    
  end
  
  describe 'view_students' do
    describe 'user is an admin' do
      before :each do
            @current_user = FactoryGirl.create(:user, user_id:'admin', email:'admin@admin.com',password:'admin',password_confirmation:'admin',role: 'Admin')
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        it 'should view students' do
          get :view_students
        end
      
      
    end
    describe 'user is not an admin' do
      before :each do
            @current_user = FactoryGirl.create(:user)
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        it  'should deny access' do
          get :view_students
          expect(flash[:notice]).to eq("You are not authorized to view students")
          expect(response).to redirect_to(home_path)
        end
    end
  end
  
  describe 'home' do
    describe 'no current user' do
      it 'should not go to home' do
        get :home
        expect(response).to redirect_to(new_user_path)
      end
    end
    describe 'user is an admin' do
      before :each do
            @current_user = FactoryGirl.create(:user, user_id:'admin', email:'admin@admin.com',password:'admin',password_confirmation:'admin',role: 'Admin')
            cookies.permanent[:session_token] = @current_user.session_token
            User.find_by_session_token(cookies[:session_token])
        end
        it 'should go to home' do
          get :home
          expect(response).to redirect_to(admin_home_path)
        end
    end
  end
  
  describe 'promote_TA' do
    it 'should make student TA' do
      @fakeStudent = FactoryGirl.create(:user, user_id:'student', email:'student@student.com',password:'student',password_confirmation:'student',role: 'Student',ta: false)
      post :promote_TA, {:userId => @fakeStudent.user_id}
      expect(flash[:notice]).to eq("Student promoted to TA")
      expect(response).to redirect_to(view_students_path)
    end
  end
  
  describe 'demote_TA' do
    before :each do 
      @fakeStudent = FactoryGirl.create(:user, user_id:'student', email:'student@student.com',password:'student',password_confirmation:'student',role: 'Student',ta: true)
    end
    it 'should make student no longer a TA' do
      post :demote_TA, {:userId => @fakeStudent.user_id}
      expect(flash[:notice]).to eq("Student is no longer a TA")
      expect(response).to redirect_to(view_students_path)
    end
  end
  
  describe 'show' do
    describe 'user is a student' do
      before :each do
        @current_user = FactoryGirl.create(:user, user_id:'student', email:'student@student.com',password:'student',password_confirmation:'student',role: 'Student',ta: true)
        cookies.permanent[:session_token] = @current_user.session_token
        User.find_by_session_token(cookies[:session_token])
      end
      it 'should deny access' do
        @fake = FactoryGirl.create(:user, user_id:'admin', email:'admin@admin.com',password:'admin',password_confirmation:'admin',role: 'Admin')
        get :show, {:id => @fake.id}
        expect(flash[:warning]).to eq("Can only show profile of logged-in	user")
      end
    end
  end
  
  describe 'admin_home' do
    before :each do
        @current_user = FactoryGirl.create(:user, user_id:'student', email:'student@student.com',password:'student',password_confirmation:'student',role: 'Student',ta: false)
        cookies.permanent[:session_token] = @current_user.session_token
        User.find_by_session_token(cookies[:session_token])
      end
      it 'should go to admin home' do
        get :admin_home
      end
  end
  
  describe 'index' do
    before :each do
        @current_user = FactoryGirl.create(:user, user_id:'student', email:'student@student.com',password:'student',password_confirmation:'student',role: 'Student',ta: false)
        cookies.permanent[:session_token] = @current_user.session_token
        User.find_by_session_token(cookies[:session_token])
      end
      it 'should go to index' do
        get :index
      end
  end
  
  describe 'new' do
      it 'should redirect_to if logged in' do
        @current_user = FactoryGirl.create(:user, user_id:'student', email:'student@student.com',password:'student',password_confirmation:'student',role: 'Student',ta: false,session_token: SecureRandom.urlsafe_base64)
        cookies.permanent[:session_token] = @current_user.session_token
        User.find_by_session_token(cookies[:session_token])
        get :new
      end
  end
end