# Multi Processing Model (mpm)
    * one and only one MPM must be loaded into the server at any time
    * In ubuntu, if not specifically setup, the dafault mpm will be event model, to change that, configure it with
	> ./configure --enable-mpm-shares='prefork event worker'
    to make the mpm modules loadable, rather than statically build in during compilation.

# PHP supporting
    Because php is not threaded safe, we can't use any multi-processing model (mpm: worker or event) module in apache2 with php. The solutions can be:
    1) non-threaded solution (preferred by php): prefork (mpm) + php
    2) performance solution (preferred by apache):  event/worker (mpm) + mod_fcgid + php-fpm

    Here are the pro and cons of each solution:
    1)	
    pros:
	* easy to setup
	    > the php module can just be downloaded from the carnonical repository as libapache2-mod-php7.3 (don't need the depended libraries) and then refer the php module to the installed libraries
	    > or just compile php as shared library
	* compatible with non-threaded-safe libraries
    cons:
	* non-threaded (multi processes)
	* prefork doesn't support http2

    2)
    pros:
	* faster and scalable threaded mpm
    cons:
	* enable php-fpm support when compile php
	    > ./configure --enable-fpm	    



## php setting 
    1)	LoadModule mpm_preforki_module modules/mod_mpm_prefork.so
	LoadModule php7_module modules/mod_php7.so
	AddType application/x-http-php .php
	AddType application/x-httpd-php .php
	<FilesMatch ".+\.php$">
		SetHandler application/x-httpd-php
	</FilesMatch>

    2)	LoadModule mpm_event_module modules/mod_mpm_event.so
	LoadModule proxy_module modules/mod_proxy.so
	LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so

	# TCP socket approach
	#ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/home/weibin/Code/Html/apache2/$1
	## unix domain socket (UDS) approach
	ProxyPassMatch ^/(.*\.php(/.*)?)$ unix:/run/php/php7.3-fpm.sock|fcgi://localhost/home/weibin/Code/Html/apache2/
	DirectoryIndex /index.php index.php

	when using UDS approach, make sure the user/group setting in both httpd.conf and php-fpm/pool.d/www.conf are the same; otherwise apache will not have the permission to read the socket.
