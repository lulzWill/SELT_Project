require 'rails_helper'
require 'spec_helper'

describe SessionsController do
    describe 'logging in' do
       it 'should redirect to the login page if User-Id or Password is incorrect' do
        expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)
     
        fakeUser= double("user")
        
        expect(User).to receive(:find_by_user_id).and_return(fakeUser)
        expect(fakeUser).to receive(:check).and_return(false)
        
        post :create, {:user => {:user_id => "fakeid",:password => "fakepass"}}
        expect(assigns(:user)).to eq(fakeUser)
        expect(response).to redirect_to(login_path)
        expect(flash[:notice]).to eq("Invalid User-ID/Password combination")
       end
       
       it 'should redirect to profile if User-Id and Password are correct' do
        expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)
     
        fakeUser= double("user")
        
        expect(User).to receive(:find_by_user_id).and_return(fakeUser)
        expect(fakeUser).to receive(:check).and_return(true)
        
        post :create, {:user => {:user_id => "fakeid",:password => "fakepass"}}
        expect(assigns(:user)).to eq(fakeUser)
        expect(response).to redirect_to("/user/index.html.haml")
       end
    end
    describe 'logging out' do
        it 'should end session and redirect to login page' do
        end
    end
end