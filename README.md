# azure-arc-multi-cluster
Azure Arc Multi Customer, Multi Cluster with multi apps

> k8s cluster: **mansfieldarcaks**
> rg: **mansfield**
> acr: **mansfieldacr.azurecr.io**

## Gitops /w Helm + Kustomize (https://github.com/joalmeid/azure-arc-multi-cluster branch:helm-kustomize)

az k8sconfiguration create --name mansfieldarcaks-config --cluster-name mansfieldarcaks --resource-group mansfield --operator-instance-name shs-helm-cluster-config --operator-namespace azure-helm-voting --operator-params='--git-readonly --git-path=releases --git-branch helm' --enable-helm-operator --helm-operator-version='0.6.0' --helm-operator-params='--set helm.versions=v3' --repository-url https://github.com/joalmeid/azure-arc-multi-cluster --scope namespace --cluster-type connectedClusters --debug

az k8sconfiguration show --name mansfieldarcaks-config --cluster-name mansfieldarcaks --resource-group mansfield --cluster-type connectedClusters

kubectl get ns --show-labels
kubectl -n shs-helm-cluster-config get deploy  -o wide

kubectl port-forward -n azure-helm-voting svc/azure-helm-voting-frontend 8080:80

az k8sconfiguration update --name mansfieldarcaks-config  --cluster-name mansfieldarcaks --resource-group mansfield --cluster-type connectedClusters --yes

az k8sconfiguration delete --name mansfieldarcaks-config  --cluster-name mansfieldarcaks --resource-group mansfield --cluster-type connectedClusters --yes

