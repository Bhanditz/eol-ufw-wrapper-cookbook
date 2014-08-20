#
# Cookbook Name:: eol-ufw-wrapper
# Recipe:: default
#

require "ostruct"

include_recipe("ufw")

def create_firewal_rule(rule_name, data)
  firewall_rule rule_name do
    name rule_name
    protocol data.protocol.to_sym if data.protocol
    port data.port.to_i if data.port
    action data.action.to_sym if data.action
  end
end

ufw_rules = data_bag_item("eol-ufw-wrapper", "config") 

ufw_rules["ufw_rules"].each do |name, data|
  data = OpenStruct.new(data)
  if data.nodes.empty? || data.nodes.include?(node.name)
    create_firewal_rule(name, data) 
  end
end
