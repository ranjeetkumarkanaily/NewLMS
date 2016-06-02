namespace :seed do
	task :db => :environment do
		50.times do |i|
			l = Lesson.create!(name: "Lesson #{i+1}")
			l.contents.create!(name: "Contnet #{i+1} 1")
			l.contents.create!(name: "Contnet #{i+1} 2")
			l.contents.create!(name: "Contnet #{i+1} 3")
		end
		Student.create!(name: "Student 1")
		puts "Lessons created #{Lesson.count} and contents created #{Content.count}"
	end

	task :students => :environment do
		t = Teacher.create!(name: "Teacher 1")
		49.times do |i|
			s = Student.create!(name: "Student #{i + 2}", teacher_id: t.id)
			s.progress = "L1 P1"
			s.progress = "L1 P2"
			s.progress = "L1 P3"	
		end
	end
end