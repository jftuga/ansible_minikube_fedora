# ansible_minikube_fedora
Install minikube on Fedora 35 using Ansible Playbook

## Synopsis
This is an ansible playbook that will install [minikube](https://minikube.sigs.k8s.io/docs/) onto a Fedora system.  It has been tested with Fedora 35 on an AWS EC2 `t3a.small` instance.

## Playbook Details

1) Configure the [inventory.ini](inventory.ini) file.
* * Replace `w.x.y.z` with your own IP address
* * Set the `ansible_ssh_private_key_file` value
* * Set the `ansible_user` value
* * * **Note:** This user should be able to ssh into the remote system without having to be prompted to accept any ssh keys by using the `ansible_ssh_private_key_file` file mentioned above
2) `Docker` will be installed via the uploaded `install_docker.sh` script
* * First, edit `DOCKER_USER` to be the same user listed in the `inventory.ini` file
* * Check `/root/install_docker.log` for any errors
3) `Minikube` will be installed via the uploaded `install_minikube.sh` script
* * Check `/root/install_minikube.log` for any errors
4) Start minikube as the `anisible_user` by using the uploaded `start_minikube.sh` script
* * Check `/home/ANSIBLE_USER/start_minikube.log` for any errors

## Execution
```shell
ansible-playbook -i inventory.ini minikube.yml
```

## Post install
* It is necessary to re-login as the `ansible_user` because this user has been added to the `docker` security group
* Run `minikube status` to check the current operation
