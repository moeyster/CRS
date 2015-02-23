class AgentMailer < ApplicationMailer
	def registration_confirmation(agent)
		mail(:to => agent.email), :subject => "Registered", :from => "admin@crs.com")
	end
end
