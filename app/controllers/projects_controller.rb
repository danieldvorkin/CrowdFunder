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
    @project = Project.find(params[:id])
  end

  private
  def project_params
  	params.require(:project).permit(:name, :description, :category_id, :funding_goal, :start_at, :end_at, :image, rewards_attributes: [:id, :description, :amount, :_destroy])
  end
end
