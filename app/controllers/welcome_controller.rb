class WelcomeController < ApplicationController
  def index
  	if agent_signed_in?
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
  end
end
