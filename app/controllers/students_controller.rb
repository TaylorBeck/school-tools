class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
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
      redirect_to students_path, notice: "#{@student.name} successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student), notice: "#{@student.name} successfully updated."
    else
      render :edit
    end
  end

  def destroy
    name = @student.name
    if @student.destroy
      redirect_to students_path, notice: "#{name} has been deleted."
    else
      redirect_to students_path, error: "Error deleting #{name}"
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end

  def set_student
    @student = Student.find(params[:id])
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
