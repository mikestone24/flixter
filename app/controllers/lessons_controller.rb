class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_lesson_if_enrolled

  def show
  end

  private
  helper_method :current_lesson
  helper_method :current_course

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  def current_course
  	@current_course ||= current_lesson.section.course
  end
   def authenticate_lesson_if_enrolled

  	 if ! current_user.enrolled_in? current_course
     	redirect_to course_path(current_course), alert: 'Not Enrolled in this course'
    end
  end


end