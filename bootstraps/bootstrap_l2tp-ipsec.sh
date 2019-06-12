# Bootstrap the system
ftp -o - https://gitlab.com/Verticaleap/openbsd-ansible-dev/raw/master/bootstraps/bootstrap_raw.sh | sh

if [[ $USERNAME == "" ]] || [[ $PASSWORD == "" ]] || [[ $PSK == "" ]] || [[ $GMAIL_ACCOUNT ]] || [[ $GMAIL_SECRET ]]; then
    echo "Please set vars for USERNAME, PASSWORD, and PSK"
    exit 1
fi

# Run playbook
cd /root/git/openbsd-ansible-dev/ && ansible-playbook install.yml --tags=users,system,l2tp-ipsec,vnstatd,unbound,sysctl_router --extra-vars="user=$USERNAME pass=$PASSWORD psk=$PSK unbound_address=10.0.0.1 vnstatd_interface=tun0 gmail_account=$GMAIL_ACCOUNT gmail_secret=$GMAIL_SECRET"
