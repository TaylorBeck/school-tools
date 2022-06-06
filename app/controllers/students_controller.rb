class StudentsController < ApplicationController
  before_action :set_breadcrumbs, only: [:index, :new, :show, :edit]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end

  def set_breadcrumbs
    add_breadcrumb("Students", students_path)

    case action_name
    when 'new'
      add_breadcrumb('New Student')
    when 'show'
      add_breadcrumb(@student.name, @student)
    when 'edit'
      add_breadcrumb(@student.name, @student)
      add_breadcrumb('Edit')
    end
  end
end
