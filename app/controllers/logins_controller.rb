class LoginsController < ApplicationController
  def new
    if logged_in?
      flash[:alert] = "Você já está logado!"
      redirect_to student_path(current_user)
    end
  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:notice] = "Estudante logado com sucesso!"
      redirect_to student
    else
      flash.now[:alert] = "Algo de errado aconteceu com seu Login"
      render "new"
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "Estudante desconectado."
    redirect_to root_path
  end
end
