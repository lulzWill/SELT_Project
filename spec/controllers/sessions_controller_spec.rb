require 'rails_helper'
require 'spec_helper'

describe SessionsController do
    describe 'logging in' do
       it 'should redirect to the login page if User-Id or Password is incorrect' do
        expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)
     
        fakeUser=double("user")
        
        expect(fakeUser).to receive(:check).and_return(false)
        expect(response).to redirect_to(login_path)
       end
       
       it 'should redirect to profile if User-Id and Password are correct' do
        expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)
     
        fakeUser= double("user")
        
        expect(User).to receive(:find_by_user_id).and_return(fakeUser)
        expect(fakeUser).to receive(:check).and_return(true)
        
        post :create, {:user => {:email => "fake@fake.com", :user_id => "fakeid", :role => "Student", :password => "fakepass"}}
        expect(assigns(:user)).to eq(fakeUser)
        expect(response).to redirect_to("/course")
       end
    end
    describe 'logging out' do
        it 'should end session and redirect to login page' do
        end
    end
end