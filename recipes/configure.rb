# (Re)starts the NAT monitor as part of the `configure` livecycle event

# Kill the NAT monitor script
execute "Kill NAT Monitor Script" do
  command "pkill -f nat_monitor"
  returns [0, 1]
end

# Start the NAT monitor script
execute "Start NAT Monitor Script" do
  command "/etc/nat_monitor.sh >>/var/log/nat_monitor/nat_monitor.log &"
end
