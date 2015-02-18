class ClientsController < ApplicationController
  def index
  	@clients = Client.all.order(updated_at: :desc)
  end

  def new
  	@client = Client.new
  end

  def create
  	@client = Client.new(client_params)

  	if @client.save
  		redirect_to clients_path, notice: "Successfully added new client! Congratulations!"
  	else
  		flash[:alert] = "Sorry, client not added, please try again."
  		render :new
  	end
  end

  def edit
  end

  private

  def client_params
  	params.require(:client).permit(:name, :mt4_id, :capital_sold)	
  end
end
