module ApplicationHelper

  def session_link
    if logged_in?
      link_to('Sair', logout_path, method: :delete)
    else
      link_to('Entrar', login_path)
    end 
  end

  def another_session_link
    if logged_in?
      link_to('Perfil', student_path(current_user))
    else
      link_to('Criar Conta', new_student_path)
    end 
  end
end
