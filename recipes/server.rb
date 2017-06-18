#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


package 'httpd'

#cookbook_file 'var/www/html/index.html' do
#  source 'index.html'
#end


remote_file '/var/www/html/robin.png' do
  source 'https://technotrainer.com/wp-content/uploads/2017/03/Robin_Beck.jpg'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
#  notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  action [ :enable, :start ]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately 
end
