# Setup installurl
echo "https://cdn.openbsd.org/pub/OpenBSD/" > /etc/installurl

# Install git
export PKG_PATH=https://cdn.openbsd.org/pub/OpenBSD/$(uname -r)/packages/$(uname -p) && pkg_add -I git ansible

# Make git folder
mkdir /root/git
cd /root/git

# Clone playbook
if [ -d /root/git/openbsd-ansible-deploy ]
then
    cd /root/git/openbsd-ansible-deploy && git pull
else
    git clone https://github.com/sasabosnic/openbsd-ansible-deploy.git
fi
