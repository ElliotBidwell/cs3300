# Presence validators for project title and description for project unit tests in /root/cs3300/spec/models
class Project < ApplicationRecord
    validates_presence_of :title, :description
end
  
