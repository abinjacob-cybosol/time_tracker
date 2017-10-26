class Task < ApplicationRecord
	belongs_to :project
	belongs_to :user

	validates_presence_of :project_id, :user_id, :task_name, :total_hours, :start_date
  	validates_numericality_of :total_hours
end
