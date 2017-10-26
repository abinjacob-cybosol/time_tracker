class Project < ApplicationRecord
	has_many :projects_user, :dependent => :destroy
  	has_many :users, :through => :projects_user
  	has_many :tasks

  	validates_presence_of :status, :name, :planned_hours, :start_date
  	validates_numericality_of :planned_hours

  	def self.statuses
    	['In Progress', 'Closed', 'Pending']
  	end

  	def member_names
  		names = self.users.pluck(:name).join(",")
  	end
end
