class Instructor::LessonsController < ApplicationController
    
    before_action :find, only: [:new, :create]
    
    def new
        @lesson = Lesson.new
    end
    
    def create
        @lesson = @section.lessons.create(lesson_params)
        redirect_to instructor_course_path(@course)
    end
    
    private
    
    def find
        @section = Section.find(params[:section_id])
    end
    
    def lesson_params
        params.require(:lesson).permit(:title, :subtitle)
    end

end
