sudo apt update
sudo apt install default-jdk
java -version


sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat


wget -c https://downloads.apache.org/tomcat/tomcat-10/v10.1.13/bin/apache-tomcat-10.1.13.tar.gz


sudo tar xf apache-tomcat-10.1.13.tar.gz -C /opt/tomcat


sudo ln -s /opt/tomcat/apache-tomcat-10.1.13 /opt/tomcat/apache-tomcat-10.1.13/

sudo chown -R tomcat: /opt/tomcat/*

sudo sh -c 'chmod +x /opt/tomcat/apache-tomcat-10.1.13/bin/*.sh'

echo "[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment="JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64"
Environment="CATALINA_PID=/opt/tomcat/apache-tomcat-10.1.13/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat/apache-tomcat-10.1.13"
Environment="CATALINA_BASE=/opt/tomcat/apache-tomcat-10.1.13"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"

ExecStart=/opt/tomcat/apache-tomcat-10.1.13/bin/startup.sh
ExecStop=/opt/tomcat/apache-tomcat-10.1.13/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target" > file

cat file

sudo cat file > /etc/systemd/system/tomcat.service


sudo systemctl daemon-reload


sudo systemctl start tomcat


sudo systemctl enable tomcat

echo "------------------------"
echo "|  tomcat is installed |"
echo "------------------------"


echo "------------------------------"
echo "|  Note the following changes |"
echo "------------------------------"

echo "modify the contents of servers.xml set port to 8088 in /opt/apache-tomcat-10.1.13/tomcat/conf/server.xml"

echo "modify the users.xml and set managers and all and set password for admin"

echo "comment the valve in mangers host "


echo "

sudo nano /opt/tomcat/apache-tomcat-10.1.13/conf/tomcat-users.xml
				^
change in the above file  ....  |


<tomcat-users>
<!--Comments-->
<role rolename="admin-gui"/>
<role rolename="manager-gui"/>
<user username="admin" password="admin_password" roles="admin-gui,manager-gui"/>
</tomcat-users>


comment out the valve in below mentioned files 

			
sudo nano /opt/tomcat/apache-tomcat-10.1.13/webapps/manager/META-INF/context.xml

sudo nano /opt/tomcat/apache-tomcat-10.1.13/webapps/host-manager/META-INF/context.xml


"


# by vittal modified 15/09/23




