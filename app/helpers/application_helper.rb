module ApplicationHelper

  def session_link
    if logged_in?
      link_to('Sair', logout_path, method: :delete)
    else
      link_to('Entrar', login_path)
    end 
  end
end
