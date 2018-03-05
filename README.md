# devops
this is my first project for devops 

oc command not found error on other placess and you have to use only ./oc  to fid this please run below command from your oc home path 

ex:sudo ln -s /home/rajesh/openshift/oc /bin/oc


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

to test login as  ./oc login -u system:admin   if you still asking password then you need add .kube config file where you have all user info  exmaple : https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/

like here  ; export KUBECONFIG=$KUBECONFIG:/home/rajesh/.kube/config

this should deferently fix your issue  now your able to login without any issues "oc login -u system:admin "

=================================================
common errors (background i have installed docker then openshift orgine its not working so i copied downloaded openshift tar to another location and started its working but its not integrated with docker i need to trobleshoot this one )

error: when i run oc status command as devloper to list projects  
erors:
  * bc/myapp is pushing to istag/myapp:latest, but the administrator has not configured the integrated Docker registry.
  * route/jenkins is routing traffic to svc/jenkins, but either the administrator has not installed a router or the router is not selecting this route.






4.  ### after install you wont get templete on login screen to fix this please fallow below steps 

https://docs.openshift.org/latest/install_config/imagestreams_templates.html



You must have cloned the repository that contains the default image streams and templates:
1.1 download openshift-ansible templet files for db / other temptlets 
be a root user and fallow below steps 
$ cd ~
$ git clone https://github.com/openshift/openshift-ansible

1.2   now export those files ocne its downoad 

$ IMAGESTREAMDIR=~/openshift-ansible/roles/openshift_examples/files/examples/v3.6/image-streams; \
    DBTEMPLATES=~/openshift-ansible/roles/openshift_examples/files/examples/v3.6/db-templates; \
    QSTEMPLATES=~/openshift-ansible/roles/openshift_examples/files/examples/v3.6/quickstart-templates
    
    
1.3 $ oc create -f $IMAGESTREAMDIR/image-streams-rhel7.json -n openshift
    $ oc create -f $DBTEMPLATES -n openshift
    $ oc create -f $QSTEMPLATES -n openshift
    
1.4 logout if your already login to webconsole  and log back in  now you will able to see all templets on screen dashboard


2.1  some times if you install docker then openshfit orgivne and delete orgivne and download tar or copy tar to diffrent folder and try to start it will start but it wont integrate with docker you will somehting like below errors , and deployment wont happend and pods wont create , 


Errors:
  * bc/myapp is pushing to istag/myapp:latest, but the administrator has not configured the integrated Docker registry.
  * route/jenkins is routing traffic to svc/jenkins, but either the administrator has not installed a router or the router is not selecting this route.
  * route/myapp is routing traffic to svc/myapp, but either the administrator has not installed a router or the router is not selecting this route.
