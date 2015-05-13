class PledgesController < ApplicationController
	def new
    @project = load_project
    @pledge = @project.pledges.build
  end

	def create
    @project = load_project
    @pledge = @project.pledges.build(pledge_params)
    @pledge.user_id = current_user.id

    respond_to do |format|
      if @pledge.save
        format.html do
          redirect_to project_path(@project.id), notice: 'Pledge created' 
        end
        format.js
      else
        format.html { render 'rootpath', alert: 'There was an error' }
      end
    end
  end

private
  def pledge_params
    {reward_id: params[:reward_id]}
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
