require 'rails_helper'
require 'spec_helper'


describe SessionsController do
   describe 'logging in' do
       it 'should redirect to the login page if User-Id or Password is incorrect'
        expect(User).to receive(:find_by_user_id).with('fakeid').and_return(false)
      
        params_hash = {:email => "fake@fake.com", :user_id => "fakeid", :role => "Student", :password => "fakepass"}
        fakeUser= double("user")
        
        expect(User).to receive(:find_by_user_id).and_return(fakeUser)
        expect(fakeUser).to receive(:check).and_return(false)
        
        post :sessions, params_hash
        expect(assigns)
       end
       
       it 'should redirect to profile if User-Id and Password are correct'
end