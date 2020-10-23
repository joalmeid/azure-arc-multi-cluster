# azure-arc-multi-cluster
Azure Arc Multi Customer, Multi Cluster with multi apps

> k8s cluster: **mansfieldarcaks**
> rg: **mansfield**
> acr: **mansfieldacr.azurecr.io**

## Gitops /w Yaml Manifests

az k8sconfiguration create --name mansfieldarcaks-config --cluster-name mansfieldarcaks --resource-group mansfield --operator-instance-name shs-cluster-config --operator-namespace shs-cluster-config --repository-url https://github.com/joalmeid/azure-arc-multi-cluster --scope cluster --cluster-type connectedClusters --operator-params='--git-branch manifests'

az k8sconfiguration show --name mansfieldarcaks-config --cluster-name mansfieldarcaks --resource-group mansfield --cluster-type connectedClusters

kubectl get ns --show-labels
kubectl -n shs-cluster-config get deploy  -o wide

az k8sconfiguration delete --name mansfieldarcaks-config  --cluster-name mansfieldarcaks --resource-group mansfield --cluster-type connectedClusters --yes