class AgentsController < ApplicationController
	def index
		@agents = Agent.all
	end

	def new
		@agent = Agent.new
	end

	def create
		@agent = Agent.new(agent_params)

		if @agent.save
			redirect_to agents_path, notice: "Successfully added " + @agent.name + "!"
		else
			flash[:alert] = "Sorry, agent not added, please try again."
			render :new
		end
	end

	def edit
		@agent = Agent.find(params[:id])
	end

	def update
		@agent = Agent.find(params[:id])
	    if @agent.update_attributes(agent_params)
	      flash[:success] = "Agent " + @agent.name + "'s details has been saved."
	      redirect_to agents_path
	    else
	      flash[:danger] = "Error: Agent " + @client.name + "'s details could not be saved. Please try again."
	      render :edit
    	end
	end

	def destroy
		 @agent = Agent.find(params[:id])

	    if @agent.destroy
	      redirect_to @agent, notice: "Agent Deleted :("
	    else
	      flash[:danger] = "Could not delete agent"
	      render :edit
	    end
	end

	private

	def agent_params
		params.require(:agent).permit(:name, :email, :password, :password_confirmation)
	end
end
