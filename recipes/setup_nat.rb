#
# Cookbook Name:: opsworks-nat-instance
# Recipe:: setup_nat
#
# Copyright 2015, MediaEvent Services GmbH & Co. KG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Copy NAT settings into place
cookbook_file "10-nat-settings.conf" do
  path "/etc/sysctl.d/10-nat-settings.conf"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

# Copy NAT script into place
cookbook_file "configure-pat.sh" do
  path "/usr/sbin/configure-pat.sh"
  action :create
  owner "root"
  group "root"
  mode "0744"
end

# Copy NAT upstart script
cookbook_file "nat.conf" do
  path "/etc/init/nat.conf"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

# Configure NAT upstart script
service 'nat' do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
