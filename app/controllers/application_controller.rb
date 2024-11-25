class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_user
  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end


  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "Você precisa estar logado para fazer esta ação!"
      redirect_to login_path
    end
  end
end
