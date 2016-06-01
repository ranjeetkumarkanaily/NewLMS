class CompletedContent < ActiveRecord::Base
	belongs_to :content
	belongs_to :student
end
