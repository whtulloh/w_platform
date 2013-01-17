class Authentication::SessionReceiversController < WPlatformController

  def index
    session[:user_features] = nil
    if has_complete_params? or (have_session=has_complete_sessions?)
      initialize_user_sessions unless have_session
      flash[:notice] = "Signed in successfully."
      redirect_to root_path
    else
      get_active_session_or_back_to_platform
    end
  end
  
end
