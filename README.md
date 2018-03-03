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
