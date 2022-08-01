#!/bin/bash

app_name=kubernetes-goat
image=kubegoat
namespace=manoj-singh8-dev

deploy=`oc get deployment $app_name -n $namespace`
if [[ "$?" -eq 0 ]]; then
    oc set image deployment/$app_name $app_name=$image -n $namespace
    oc rollout restart deployment/$app_name -n $namespace
else
    oc new-app $image --name $app_name -n $namespace
fi
