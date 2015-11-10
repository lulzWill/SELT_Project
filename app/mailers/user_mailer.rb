class UserMailer < ActionMailer::Base
  default from: "notification@noreply.com"
  
  def welcome_email(user)
	  @user = user
	  mail(:to => user.email, :subject => "Thank you for signing up!")
  end
  
  
  
  #def new_email(email)
  #mail(:to => email, :subject => "Verification Email")
  #end
end
