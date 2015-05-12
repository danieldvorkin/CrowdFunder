class PledgesController < ApplicationController
	def new
    @project = load_project
    @pledge = @project.pledges.build
  end

	def create
    @project = load_project
    @pledge = @product.pledges.build(pledge_params)
    @pledge.user = current_user

    respond_to do |format|
      if @pledge.save
        format.html do
          redirect_to project_path(@project.id), notice: 'Pledge created' 
        end
        format.js
      else
        format.html { render 'pledges/show', alert: 'There was an error' }
      end
    end
  end

private
  def pledge_params
    params.require(:pledge).permit(:contribution, :project_id, :reward_id, :user_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
