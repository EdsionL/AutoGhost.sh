#!/bin/sh
# ===============================
#     AutoGhost version 1.1
#   http://evil7.net/autoghost
#  Code at 2015-11-04   by evil7
# ===============================

# Begin

clear
echo ""
echo "######################################################"
echo "#                                                    #"
echo "#    o------------------------------------------o    #"
echo "#    |         Thanks for use AutoGhost         |    #"
echo "#    |     Oneclick to build your GhostBlog !   |    #"
echo "#    o------------------------------------------o    #"
echo "#                                                    #"
echo "#                .: Power by Evil7 :.                #"
echo "#         Build with NodeJS + SQLite3 + Nginx        #"
echo "#           [ http://evil7.net/AutoGhost ]           #"
echo "#                                                    #"
echo "#                        v1.1                        #"
echo "######################################################"
echo ""
echo " >>> Only try with Ubuntu (maybe working with debian) "
echo " >>> Need you run this script use sudo !              "
echo ""
echo " # Please input your Blog's domain : "
read -p "   http://" URL

# apt-get update and install curl unzip

sudo apt-get update --yes
sudo apt-get install --yes curl
sudo apt-get install --yes unzip

# install nodejs

curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install --yes nodejs
ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install --yes build-essential

#Download GhostBlog

cd /
mkdir srv
cd /srv
rm -rf ghost
curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip
unzip -uo ghost.zip -d ghost
rm -rf ghost.zip

#install GhostBlog

cd /srv/ghost
sudo npm install --production
mv config.example.js config.js

# I don't know how to use $URL with sed... So I use this way...
# I have try without echo but it put string "$URL" in not put the real-domain into file.
# If who know how to coding this CMD more beautiful please tell me !
# q(ToT)p ~help!

echo "sed -i 's/my-ghost-blog.com/"$URL"/g' config.js" > setconfig.sh
echo "sed -i 's/localhost:2368/"$URL"/g' config.js" >> setconfig.sh
sh setconfig.sh
rm -rf setconfig.sh
sed -i 's/data\/ghost/data\/#ghost/g' config.js
rm -rf /srv/ghost/content/data/*.db

# install forever keep Ghost online

npm install forever -g
forever stop all
forever start /srv/ghost/index.js
sed -i '/forever start \/srv\/ghost\/index.js/d' /etc/rc.local
sed -i '/exit 0/d' /etc/rc.local
echo "forever start /srv/ghost/index.js" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

# install watchdog make sure vps always alive

sudo apt-get install --yes watchdog

# install nginx echo config in ghost.config

sudo apt-get install --yes nginx
rm -rf /etc/nginx/sites-available/ghost.conf
rm -rf /etc/nginx/sites-enabled/ghost.conf
echo 'server {' >> /etc/nginx/sites-available/ghost.conf
echo 'listen 80;' >> /etc/nginx/sites-available/ghost.conf
echo 'server_name '$URL';' >> /etc/nginx/sites-available/ghost.conf
echo 'location / {' >> /etc/nginx/sites-available/ghost.conf
echo 'proxy_set_header   X-Real-IP	$remote_addr;' >> /etc/nginx/sites-available/ghost.conf
echo 'proxy_set_header   Host	$http_host;' >> /etc/nginx/sites-available/ghost.conf
echo 'proxy_pass         http://127.0.0.1:2368;' >> /etc/nginx/sites-available/ghost.conf
echo '}' >> /etc/nginx/sites-available/ghost.conf
echo '}' >> /etc/nginx/sites-available/ghost.conf
ln -s /etc/nginx/sites-available/ghost.conf /etc/nginx/sites-enabled/ghost.conf
service nginx restart

# finish

clear
echo ""
echo "######################################################"
echo "#                                                    #"
echo "#    o------------------------------------------o    #"
echo "#    |         Thanks for use AutoGhost         |    #"
echo "#    |     Oneclick to build your GhostBlog !   |    #"
echo "#    o------------------------------------------o    #"
echo "#                                                    #"
echo "#                .: Power by Evil7 :.                #"
echo "#         Build with NodeJS + SQLite3 + Nginx        #"
echo "#           [ http://evil7.net/AutoGhost ]           #"
echo "#                                                    #"
echo "#                        v1.1                        #"
echo "######################################################"
echo ""
echo " >>> Your blog : http://"$URL
echo " >>> All GhostBlog files install in : /srv/ghost"
echo " >>> Database : /srv/ghost/content/data/#ghost-dev.db"
echo " >>> Nodejs : "`node -v`"    npm : "`npm -v`
echo ""
echo " # All install done !"
echo " # Enjoy your GhostBlog !"
echo ""
