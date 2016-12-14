include_recipe 'firewall::default'

ports = node['silkstyle']['open_ports']
firewall_rule "open ports #{ports}" do
  port ports
end
