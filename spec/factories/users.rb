FactoryGirl.define do
  factory :user do
    user_id "admin"
    email  "admin@admin.com"
    password  "admin1"
    password_confirmation "admin1"
    role "Student"
  end
  
  factory :ta, :class => "user" do
    user_id "ta"
    email "ta@ta.com"
    password "qwerty"
    password_confirmation "qwerty"
    role "Student"
    ta true
  end
  
  factory :non_logged_user, parent: :user do
    self.session_token = nil
  end
end