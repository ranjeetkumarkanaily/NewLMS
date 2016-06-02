class StudentsController < ApplicationController
	def setprogress
		student = Student.find(params[:id])
		student.progress = params[:lesson_content]
		render :json => "Student progress saved."
	end

	def progress
		student = Student.find(params[:id])
		render :json => {student.name => student.progress}
	end
end
