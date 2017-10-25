class Project < ApplicationRecord
	has_many :users , :through => :members
  	has_many :members, :dependent => :destroy
  	has_many :tasks
end
