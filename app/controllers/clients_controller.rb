class ClientsController < ApplicationController
  def index
  	@clients = Client.all.order(updated_at: :desc)
  end

  def new
  	@client = Client.new
    
  end

  def create
  	@client = Client.new(client_params)
    @client.agent_id = current_agent.id 
  	if @client.save
  		redirect_to clients_path, notice: "Successfully added new client! Congratulations!"
  	else
  		flash[:alert] = "Sorry, client not added, please try again."
  		render :new
  	end
  end

  def edit
    @client = Client.find(params[:id])
    authorize! :update, @client
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      flash[:success] = "Client " + @client.name + "'s details has been saved."
      redirect_to clients_path
    else
      flash[:danger] = "Error: Client " + @client.name + "'s details could not be saved. Please try again."
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])

    if @client.destroy
      redirect_to @client, notice: "Client Deleted :("
    else
      flash[:danger] = "Could not delete client"
      render :edit
    end
  end

  private

  def client_params
  	params.require(:client).permit(:name, :mt4_id, :capital_sold, :agent_id)	
  end
end
