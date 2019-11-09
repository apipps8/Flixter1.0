class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section, only: [:new, :create]
  before_action :require_authorized_for_current_lesson, only: [:update]
  def new
    @section = Section.find(params[:section_id])
    @lesson = Lesson.new
  end

  def create
    @section = Section.find(params[:section_id])
    
    @lesson = @section.lesson.create(lesson_params)
    redirect_to instructor_course_path(@section.course)
  end

    def update
      current_lesson.update_attributes(lesson_params)
      render plain: 'updated!'
  end

  private

    def require_authorized_for_current_lesson
    if current_lesson.section.course.user != current_user
      render plain: 'Unauthorized', status: :unauthorized
    end
  end



  def lesson_params
params.require(:lesson).permit(:title, :subtitle, :video, :row_order_position)
  end
end