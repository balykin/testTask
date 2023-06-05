#!/bin/bash
echo -e "Checking Objectives..."
OBJECTIVE_NUM=0
function printresult {
  ((OBJECTIVE_NUM+=1))
  echo -e "\n----- Checking Objective $OBJECTIVE_NUM -----"
  echo -e "----- $1"
  if [ $2 -eq 0 ]; then
      echo -e "      \033[0;32m[COMPLETE]\033[0m Congrats! This objective is complete!"
  else
      echo -e "      \033[0;31m[INCOMPLETE]\033[0m This objective is not yet completed!"
  fi
}

expected="true"
actual=$(! ( kubectl get configmap haproxy-config -o jsonpath='{.data.haproxy\.cfg}' 2>/dev/null |  grep -q 8181 ) || echo true)
[[ "$actual" = "$expected" ]]
printresult "Create a ConfigMap to store an haproxy config file." $?

expected="818180"
actual=$(kubectl get service api-svc -o jsonpath='{.spec.ports[0].port}{.spec.ports[0].targetPort}' 2>/dev/null)
[[ "$actual" = "$expected" ]]
printresult "Update a Service to serve on a new port." $?

expected="haproxy:2.4This is a response from the API!true"
actual=$(kubectl get pod client -o jsonpath='{.spec.containers[?(@.image=="haproxy:2.4")].image}' 2>/dev/null)$(kubectl exec client -c main -- curl localhost:7171 2>/dev/null)$(! ( kubectl logs client -c main 2>/dev/null |  grep -q "This is a response from the API!" ) || echo true)
[[ "$actual" = "$expected" ]]
printresult "Re-configure a Pod to use an haproxy ambassador container." $?
