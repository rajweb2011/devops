#export kubeconfig so you wont ask for password when you run admin command 
#root/.kube/config if its not there create one   mkdir  .kube  and config 

export KUBECONFIG=/home/rajesh/openshift/openshift.local.config/master/admin.kubeconfig
export KUBECONFIG=$KUBECONFIG:/.kube/config

#load templets and images so you can browuse from console for easy deployments 

export IMAGESTREAMDIR=~/openshift-ansible/roles/openshift_examples/files/examples/v3.6/image-streams
export DBTEMPLATES=~/openshift-ansible/roles/openshift_examples/files/examples/v3.6/db-templates
export QSTEMPLATES=~/openshift-ansible/roles/openshift_examples/files/examples/v3.6/quickstart-templates
