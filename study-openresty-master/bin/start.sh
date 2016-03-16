if not nginx then
	sudo /usr/local/openresty/nginx/sbin/nginx -t -c /opt/study-openresty-master/config/nginx.conf
	sudo /usr/local/openresty/nginx/sbin/nginx -c /opt/study-openresty-master/config/nginx.conf
else
	sudo /usr/local/openresty/nginx/sbin/nginx -t
	sudo /usr/local/openresty/nginx/sbin/nginx -s reload
end