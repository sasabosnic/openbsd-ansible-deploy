# Bootstrap the system
ftp -V -o - https://github.com/sasabosnic/openbsd-ansible-deploy/raw/master/bootstraps/bootstrap_raw.sh | sh

# Extra variables for playbook
extra_vars="\
role_sysctl_task=router_sysctl \
unbound_address=10.10.0.1 \
vnstatd_interface=wg0"

# Run playbook
cd /root/git/openbsd-ansible-deploy/ && ansible-playbook install.yml --tags=users,system,wireguard-pf,wireguard-configs,unbound,vnstatd,ifstated,sysctl --extra-vars="$extra_vars"
