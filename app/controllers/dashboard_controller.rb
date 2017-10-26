class DashboardController < ApplicationController
  def index
  	if params[:project_id] && (params[:project_id] != "")
      @tasks = current_user.tasks.where(project_id: params[:project_id])
    else
      @tasks = current_user.tasks
    end
    @projects = current_user.projects
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }
      format.xls
    end
  end
end
