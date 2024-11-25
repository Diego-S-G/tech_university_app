class StudentsController < ApplicationController
  skip_before_action :require_user, only: [ :new, :create ]
  before_action :set_student, only: %i[ show edit update destroy ]
  before_action :require_same_user, only: [ :edit, :update ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    if !logged_in?
      @student = Student.new
    else
      flash[:alert] = "Você já está logado!"
      redirect_to student_path(current_user)
    end
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      # session[:user_id] = @student.id
      flash[:notice] = "Bem-vindo(a) à Tech University, #{@student.name}!"
      redirect_to @student
    else
      render "new"
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    if @student.update(student_params)
      flash[:notice] = "Informações atualizadas com sucesso!"
      redirect_to @student
    else
      render "edit"
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_path, status: :see_other, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end

    def require_same_user
      if current_user != @student
        flash[:alert] = "Você não é este usuário para fazer isto!"
        redirect_to @student
      end
    end
end
