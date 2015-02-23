class WelcomeController < ApplicationController
  def index
  	if agent_signed_in?
  		@goals = Goal.all
  		@achieved_percent = (Client.count*100)/@goals.first.client_target
  		@agents = Agent.where("id != '8'")
	  	@clients = Client.all
	  	@totalClients = Client.count
	  	@totalCapitalSold = Client.sum(:capital_sold)
	else
		redirect_to new_agent_session_path
	end
  end

  def show
    @agent = Agent.find(params[:id])

    if params[:search]
      @clients = @agent.clients.search(params[:search]).order(updated_at: :desc)
    else
      @clients = @agent.clients.order(updated_at: :desc)
    end
  end

  def edit
  	@goal = Goal.first
  end

  def update
  	@goal = Goal.first
    if @goal.update_attributes(goal_params)
      flash[:success] = "Goal updated!"
      redirect_to root_path
    else
      flash[:danger] = "Sorry could not update goal."
      redirect_to root_path
    end
  end

  private

  def goal_params
  	params.require(:goal).permit(:client_target)
  end
end
