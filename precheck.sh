if [ `whoami` != 'root' ]
then
        echo 'You are not root,Please log in to execute this script with root!'
        exit 0
fi
####### Disable selinux & firewall ############
setenforce 0
sed -i '/^SELINUX=.*/ s//SELINUX=disabled/' /etc/selinux/config
systemctl stop firewalld.service
systemctl disable firewalld.service
