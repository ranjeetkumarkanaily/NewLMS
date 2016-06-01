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
end