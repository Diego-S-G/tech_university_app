class StudentCoursesController < ApplicationController

  def create
    course_to_add = Course.find(params[:course_id])

    unless current_user.courses.include?(course_to_add)
      StudentCourse.create(course: course_to_add, student: current_user)
      flash[:notice] = "Parabéns! Você se matriculou no curso #{course_to_add.name}!"
      redirect_to current_user
    else
      flash[:alert] = 'Algo de errado aconteceu com sua tentativa de matrícula...'
      redirect_to root_path
    end
  end

  def destroy
    student_course = StudentCourse.find_by(course: params[:course_id], student: current_user)
    
    student_course.destroy
    flash[:notice] = "Você saiu do curso #{student_course.course.name} :("
    redirect_to student_course.course
  end
end
