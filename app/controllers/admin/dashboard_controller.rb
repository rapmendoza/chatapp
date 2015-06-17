module Admin
  class DashboardController < ApplicationController
    before_filter :require_admin

    def index
    end

    private

    def require_admin
      redirect_to root_path if current_user.nil? || !current_user.is_admin
    end
  end
end
