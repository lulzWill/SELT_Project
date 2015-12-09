class Assignment < ActiveRecord::Base
    belongs_to :courses
    serialize :grades, Hash
    
    def self.createAssignment(courseID,title,points,dueDate)
        if(!self.validCourse(courseID)) 
            return "Unable to create assignment. There was no course for the assignment"
        end
        if(!self.validName(title))
            return "Unable to create assignment. The name entered was not valid"
        end
        points = self.validPoints(points)
        #if(!self.validDueDate(dueDate))
         #   return "Unable to create assignment. The due date is past"
        #end
        
        return self.create!(course_id: courseID, title: title, points: points, start_at: dueDate, end_at: dueDate)
    end
    
    def self.updateAssignment(assignmentID, name, points, date)
        if(!self.validAssignment(assignmentID)) 
            return "Unable to update assignment"
        end
        if(!self.validName(name))
            return "Unable to update assignment. The name entered was not valid"
        end
        points = self.validPoints(points)
        assignment = self.find(assignmentID)
        assignment.title = title
        assignment.points = points
        assignment.start_at = date
        assignment.save
        return assignment.save
    end

    def self.validAssignment(assignmentID)
        if(Assignment.exists?(assignmentID))
            return true
        else
            return false
        end
    end    
    
    def self.validCourse(courseID)
        if(Course.exists?(courseID))
            return true
        else
            return false
        end
    end
    
    def self.validName(name)
        if(!name.is_a? String)
            return false
        end
        if(name == nil || name.gsub(' ', '') == '')
            return false
        end
        return true
    end
    
    def self.validPoints(points)
        if(points.is_a? String)
            if(self.numeric?(points))
                points = points.to_i
            else
                points = 0
            end
        end
        if(points == nil)
            return 0
        end
        return points
    end
    
    def self.validDueDate(dueDate)
       if(dueDate.past?) 
       end
    end
    
    def self.numeric?(string)
    # `!!` converts parsed number to `true`
        !!Kernel.Float(string) 
    rescue TypeError, ArgumentError
        false
    end
end    