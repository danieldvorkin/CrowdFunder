class PledgesController < ApplicationController
	def new
    @project = load_project
    @pledge = @project.pledges.build
  end

	def create
    @project = load_project
    @reward = @project.rewards.find(params[:reward_id])
    @pledge = @project.pledges.new(reward: @reward, user: current_user, contribution: @reward.amount)

    respond_to do |format|
      if @pledge.save
        format.html { redirect_to project_path(@project.id), notice: "Pledged #{ActionController::Base.helpers.number_to_currency @reward.amount}" }
        format.js
      else
        raise
        format.html { render 'rootpath', alert: 'There was an error' }
      end
    end
  end

private
  def load_project
    @project = Project.find(params[:project_id])
  end
end
