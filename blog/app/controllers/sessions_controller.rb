class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end

  def create
    admin = Admin.find_by(name: session_params[:name])

    if admin&.authenticate(session_params[:password])
      session[:admin_id] = admin.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private
    def session_params
      params.require(:session).permit(:name, :password)
    end
end
