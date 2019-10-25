# install ruby-on-rails on PC
0. prerequisite:
    * sudo apt install libsqlite3-dev
    * newest version of yarn:
	> curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	> echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	> sudo apt install yarn
1. installing ruby (requires ruby version >= 2.4.4)
    sudo apt install ruby-full	
2. installing rails
    * update gem manager
	gem update –system
    * install latest version of Rails:
	sudo gem install rails
    * install bundler gem
	sudo gem install bundler
3. test rail installation
    * rails new project
    * cd project
    * bundle install --path vendor/bundle
    * rails webpacker:install

    * run it:
	rails server
    * check it in browser: localhost:3000

# on Raspberry Pi
The raspberry pi debian repository only has old version of ruby, so to install rails, one has to either compile the newest verison of ruby by themselves or use RVM: Ruby enVironment Manager

0. prerequisite packages
    * nodejs
    * yarn: see before
1. open up rvm
    curl -L get.rvm.io | bash -s stable --rails
2. running rvm:
    source ~/.rvm/scripts/rvm

    > rvm help mount
	to get more info on binary rubies
3. running rails
    > rails new project

## Compile ruby
then following the steps on PC
