adduser jenkins
gpasswd -a jenkins docker
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload