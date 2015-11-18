class Assignment < ActiveRecord::Base
    belongs_to :course
    belongs_to :user
    
    def self.createAssignment(courseID,name,points)
        if(!self.validCourse(courseID)) 
            return "Unable to create assignment. There was no course for the assignment"
        end
        if(!self.validName(name))
            return "Unable to create assignment. The name entered was not valid"
        end
        points = self.validPoints(points)
        
        return self.create!(course_id: courseID, name: name, points: points)
    end
    
    def self.updateAssignment(assignmentID,name, points)
        if(!self.validAssignment(assignmentID)) 
            return "Unable to update assignment"
        end
        if(!self.validName(name))
            return "Unable to update assignment. The name entered was not valid"
        end
        points = self.validePoints(points)
        assignment = self.find(assignmentID)
        assignment.name = name
        assignment.points = points
        assignment.save
        return assignment.save
    end

    def self.validAssignment(assignmentID)
        if(Course.exists?(assignmentID))
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
        if(name == nil && name.gsub(' ', '') == '')
            return false
        end
        return true
    end
    
    def self.validPoints(points)
        if(points == nil || points.gsub(' ', '') == '')
            return 0
        end
        return points
    end
end    