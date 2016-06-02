class Teacher < ActiveRecord::Base
	has_many :students

	def studentsProgress
		students_progress = {}
		students.includes(:contents).each do |s|
			students_progress[s.name] = s.progress	
		end
		students_progress
	end
end
