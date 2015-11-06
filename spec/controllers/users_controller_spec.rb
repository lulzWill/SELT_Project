require 'rails_helper'

describe UsersController do
  describe 'creating a User' do
    it 'should call the model method to make a new user and the method model to save a new user and redirect to login when successful' do
      expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)
      
      params_hash = {:email => "fake@fake.com", :user_id => "fakeid", :role => "Student", :password => "fakepass"}
      fakeUser = double("user");
      
      expect(User).to receive(:new).and_return(fakeUser)
      expect(fakeUser).to receive(:save).and_return(true)
      
      post :users, params_hash
      expect(assigns(:user)).to eq fakeUser
      expect(response).to redirect_to(login_path)
      expect(flash[:notice]).to eq("You have successfully signed up as a Student")
    end
    
    it 'should redirect to sign up page if there is an error creating the user' do
      expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)
      
      params_hash = {:email => "fake@fake.com", :user_id => "fakeid", :role => "Student", :password => "fakepass"}
      fakeUser = double("user");
      
      expect(User).to receive(:new).and_return(fakeUser)
      expect(fakeUser).to receive(:save).and_return(false)
      
      post :users, params_hash
      expect(assigns(:user)).to eq fakeUser
      expect(response).to redirect_to(new_user_path)
      expect(flash[:notice]).to eq("Sorry, something went wrong. Please try again")
    end
    
    it 'should redirect to sign up page if the user already exists in the database' do
      expect(User).to receive(:find_by_user_id).with('fakeid').and_return(true)
      
      params_hash = {:email => "fake@fake.com", :user_id => "fakeid", :role => "Student", :password => "fakepass"}
      
      post :users, params_hash
      expect(response).to redirect_to(new_user_path)
      expect(flash[:notice]).to eq("Sorry, but that user id is already taken")
    end
  end
end