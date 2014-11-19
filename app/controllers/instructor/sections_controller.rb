class Instructor::SectionsController < ApplicationController
    
    before_action :find, only: [:new, :create]
    
    def new
        @section = Section.new
    end
    
    def create
        @section = @course.sections.create(section_params)
        redirect_to instructor_course_path(@course)
    end
    
    private
    
    def section_params
        params.require(:section).permit(:title)
    end
    
    def find
        @course = Course.find(params[:course_id])
    end
    
end
