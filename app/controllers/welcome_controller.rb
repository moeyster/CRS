class WelcomeController < ApplicationController
  def index
  	@clients = Client.all
  	@totalClients = Client.count
  	@totalCapitalSold = Client.sum(:capital_sold)
  end
end
