class TeachersController < ApplicationController
  def studentsprogress
  	t = Teacher.find(params[:id])
  	render :json => t.studentsProgress
  end
end
