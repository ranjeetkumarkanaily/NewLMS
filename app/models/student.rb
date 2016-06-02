class Student < ActiveRecord::Base
	has_many :completed_contents
	has_many :contents, :through => :completed_contents

	belongs_to :teacher

	def createProgress content_id
		CompletedContent.where(content_id: content_id, student_id: self.id).first_or_create
	end

	def progress= lessonContentNumber="L1 P1"
		inputArray = lessonContentNumber.split(' ')
		
		lessonNumber = numberFromInput inputArray[0]
		contentNumber = numberFromInput inputArray[1]

		contents = Content.where(lesson_id: lessonNumber)
		content = contents[contentNumber - 1]

		createProgress content.id if content
	end

	def progress
		completedLessons = completedContents	
		completedLessons.join(',')
	end

	def nextContent
		lastCompletedLesson = completedContents[-1]	
		if lastCompletedLesson.nil?
			l = Lesson.first
			return l.id, l.contents.first.id
		else
			Lesson.all.each do |l|
				result, c_id = lessonCompleted? l.id
				if result
					next
				else
					return l.id, c_id
				end
			end
			return "All Completed"
		end
	end

	def lessonCompleted? lesson_id
		l = Lesson.find(lesson_id)
		l_contents = l.contents
		studentCompletedLessons = completedContents

		l_contents.each_with_index do |c, i|
			tempContent = "L#{lesson_id} P#{i+1}"
			
			if studentCompletedLessons.include? tempContent
				next
			else
				return [false, c.id]
			end
		end
		[true, 0]
	end

	private
		def numberFromInput input
			input.split('')[1..-1].join.to_i	
		end

		def completedContents
			completedContents = []
			contents.sort.group_by(&:lesson_id).each do |lesson_id, lessonContents|
				lessonContents.each_with_index do |c, i|
					completedContents << "L#{lesson_id} P#{i+1}"
				end
			end
			completedContents	
		end
end
