So essentially we provisioned a vm to host our github action runners. We then
ran git_or_runner.sh script to configure the runners. confirmations were done in
the github GUI to confirm they were set up. However, the runner configuration script declares a user. this user will be used to install package configurations in the VM
Next, is to install all necessary packages on this vm in order for the runners to
successfully build all commands deployed to it.
To acheive this we wrote a script to install all necessary packages and then,
logged into the vm, in order to run it. To run it, we first switched users to the
user created in the runner script and then ran the package install script- org_level_VM_config.sh
also the user could not run kubectl commands because it had no access to the
kubeconfig file. To enusre this, we created a .kube directory and vim..ed a config
file. In the config file the kubeconfig key was pasted and saved. And with this,the
user was able to run kubectl commands.

the tool k9s can be used to navigate the cluster on a gui rather than struggling with k8s commands

to verify that the installed packages are working, we will write a short ci to list
docker images and k8s ns. we used th e ci 007 but ran it in the github specified ci path github.yml.
It ran succesfully on the runner and on the github gui, we saw all containers listed
in the runner actions.
