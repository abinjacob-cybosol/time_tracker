class Task < ApplicationRecord
	require 'csv'
	belongs_to :project
	belongs_to :user

	validates_presence_of :project_id, :user_id, :task_name, :total_hours, :start_date
  	validates_numericality_of :total_hours

  def self.to_csv
  	CSV.generate do |csv|
	 		## Header values of CSV
	    csv << ["Task","Project","User","Hours","Start Date","End Date"]
      all.each do |task|
      	csv << [task.task_name,task.project.try(:name),task.user.try(:name),task.total_hours,task.start_date.try(:strftime,"%Y-%b-%d"),task.end_date.try(:strftime,"%Y-%b-%d")]
  		end
  	end
  end
end
