class AddAgentToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :agent, index: true
    add_foreign_key :clients, :agents
  end
end
