# Bootstrap the system
ftp -V -o - https://github.com/sasabosnic/openbsd-ansible-deploy/raw/master/bootstraps/bootstrap_raw.sh | sh

# Extra variables for playbook
extra_vars="\
role_sysctl_task=router_sysctl"

# Run playbook
cd /root/git/openbsd-ansible-deploy/ && ansible-playbook install.yml --tags=users,system,sysctl,aria --extra-vars="$extra_vars"
