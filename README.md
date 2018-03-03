# devops
this is my first project for devops 


INSTALL OPENSHIFT ORGIEN AFTER LOGIN USING OC COMMAND YOU WILL SEE SOME ERROR LIKE   
error YOU WILL GET LIKE BELOW  : ./oc login -u system:admin

[root@master openshift]# ./oc login -u system:admin 
Authentication required for https://192.168.0.28:8443 (openshift)
Username: system:admin
Password: 
error: username system:admin is invalid for basic auth - verify you have provided the correct host and port and that the server is currently running.
error: username system:admin is invalid for basic auth


TO FIX PLESAE USBE BELOW STEPS 
1. FIND OUT admin.kubeconfig file   shuld be /openshift home / openshift.local.config/master/admin.kubeconfig
easy way to find   use "locate admin.kubeconfig"
ex :  /home/rajesh/openshift/openshift.local.config/master/admin.kubeconfig

2. now exprot that path 
export KUBECONFIG=/home/rajesh/openshift/openshift.local.config/master/admin.kubeconfig

3. now run your oc command 
./oc login -u system:admin 

(it will login this time without any password )

system:admin credentials live in a client certificate. If you get prompted for a password, that means your $KUBECONFIG file does not contain those credentials. You need to locate the admin.kubeconfig file generated at server start and do
export KUBECONFIG=/path/to/admin.kubeconfig

Then you will be able to run cluster admin commands.
