# Getting all pods from all namespaces
kubectl get pods --all-namespaces

# Delete unused persistent volumes (PVs) and persistent volume claims (PVCs)
# that are not associated with any pods.
kubectl get pv|grep Released|awk -F" " '{ print "kubectl delete pv " $1 }'|sh