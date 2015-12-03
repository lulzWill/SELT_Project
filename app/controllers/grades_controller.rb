class GradesController < ApplicationController
    before_filter :set_current_user
    
    def new
    #render new template
    end
    
    def create
        if(Assignment.find(params[:assignment_id])) 
            assignment = Assignment.find(params[:assignment_id])
            
            grade_hash = Hash.new
            params[:grade].each do |user_id, points|
                if points != ""
                    grade_hash.merge!(user_id => points)
                end
            end

            attributes_to_update = {:grades => assignment.grades.merge(grade_hash)}
            if assignment.update_attributes!(attributes_to_update)
                flash[:notice] = "successfully added grades!"
            else
                flash[:notice] = "Unable to add grades!"
            end
            redirect_to "/#{params[:course_id]}/#{params[:assignment_id]}/grades"
        else
            flash[:notice] = "Assignment does not exist!"
            redirect_to course_path
        end
    end
    
    def show
        
    end
    
    def index
        if(!Assignment.find(params[:assignment_id]))
            flash[:message] = "Assignment does not exist!"
            redirect_to assignments_home_path
        else
            @assignment = Assignment.find(params[:assignment_id])
            @course = Course.find(@assignment.course_id)
            @grades = @assignment.grades
            @grade_stats = {"0-10" => 0, "10-20" => 0, "20-30" => 0, "30-40" => 0, "40-50" => 0, "50-60" => 0, "60-70" => 0, "70-80" => 0, "80-90" => 0, "90-100" => 0, ">100" => 0}
            sum = 0
            
            @grades.each do |user, points|
                outofhundred = 100*Float(points)/@assignment.points
                sum += outofhundred
                
                if(outofhundred >= 0 && outofhundred < 10)
                    @grade_stats["0-10"] += 1
                elsif(outofhundred >= 10 && outofhundred < 20)
                    @grade_stats["10-20"] += 1
                elsif(outofhundred >= 20 && outofhundred < 30)
                    @grade_stats["20-30"] += 1
                elsif(outofhundred >= 30 && outofhundred < 40)
                    @grade_stats["30-40"] += 1
                elsif(outofhundred >= 40 && outofhundred < 50)
                    @grade_stats["40-50"] += 1
                elsif(outofhundred >= 50 && outofhundred < 60)
                    @grade_stats["50-60"] += 1
                elsif(outofhundred >= 60 && outofhundred < 70)
                    @grade_stats["60-70"] += 1
                elsif(outofhundred >= 70 && outofhundred < 80)
                    @grade_stats["70-80"] += 1
                elsif(outofhundred >= 80 && outofhundred < 90)
                    @grade_stats["80-90"] += 1
                elsif(outofhundred >= 90 && outofhundred < 100)
                    @grade_stats["90-100"] += 1
                elsif(outofhundred >= 100)
                    @grade_stats[">100"] += 1
                end
            end
            if @grades.count != 0
                @average = sum/@grades.count
            else
                @average = 0
            end
            
            @userlist = Array.new
            @course.users.each do |user|
                if(user.role.eql?("Student"))
                    @userlist << {:id => user.user_id, :points => @grades[user.user_id]}
                end
            end
        end
    end
end