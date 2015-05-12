class ProjectsController < ApplicationController
  def index
  	@project = Project.all
  end

  def new
  	@project = Project.new
  	@project.rewards.build
  end

  def create
  	@project = Project.new(project_params);
  	if @project.save
  		redirect_to projects_url
  	else
  		render 'new'
  	end
  end

  def show
    # Nothing yet.....
  end

  private
  def project_params
  	params.require(:project).permit(:name, :description, :funding_goal, :start_at, :end_at)
  end
end
