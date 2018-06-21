!!! don't forget the semi-colon at the end of mysql command.

# first log in and set password for root
$ mysql -u root 
# At the mysql console:
$ mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('password');

# if you have already set a password for the mysql root, you will 
# need to use:
$ mysql -u root -p
# if you forget your password, to reset root password
$ sudo service mysql stop
$ sudo /usr/sbin/mysqld --skip-grant-tables --skip-networking & # start the mysqld deamon process using the --skip-grant-tables optioin 
$ mysql -u root  # start the mysql client process
$ mysql> FLUSH PRIVILIGES; # enable to change any password  
$ mysql> SET PASSWORD FOR root@'localhost' = PASSWORD('password'); # change password
$ UPDATE mysql.user SET Password=PASSWORD('newpwd') WHERE User='root'; # if you have a mysql root account that can connect from everywhere, this is what you should do
$ USE musql
  UPDATE user SET Password = PASSWORD('newpwd')
  WHERE Host = 'localhost' AND User = 'root';  # alternate Method
$ USE mysql
  UPDATE user SET Password = PASSWORD('newpwd') WHERE Host = '%' AND User = 'root'; # for remote-access enabled account
$ sudo service mysql stop
$ sudo service mysql start  # relaunch mysqld process

# the easiest method
$ sudo dpkg-reconfigure mysql-server-N.N  


# create a mysql database
$ mysql> CREATE DATABASE database1;

# create a mysql user with all priviliges
$ mysql> GRANT ALL PRIVILIGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
# a user with limited priviliges
$ mysql> GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON database1.* TO 'username'@'localhost' IDENTIFIED BY 'password';

# to quit
$ mysql> \q
