class ApplicationController < ActionController::Base
    helper_method :current_admin
    before_action :login_required, only: [:new, :edit, :update, :destroy]

    private

    def current_admin
        @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
    end

    def login_required
        redirect_to login_path unless current_admin
    end
end
