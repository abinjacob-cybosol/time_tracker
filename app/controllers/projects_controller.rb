class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy,:show]
  def index
    if params[:project_id] && (params[:project_id] != "")
      @projects = current_user.projects.where(id: params[:project_id])
    else
      @projects = current_user.projects
    end
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :status, :start_date, :end_date, :planned_hours, :project_id)
  end
end
