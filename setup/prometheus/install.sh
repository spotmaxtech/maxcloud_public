#!/bin/bash

namespace="spotmax-maxcloud"

#安装 kube-prometheus-statck
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install kube-prometheus-stack  prometheus-community/kube-prometheus-stack  -n $namespace  --version 21.0.0



#Isito 监控数据采集
kubectl apply -f ServiceMonitor.yaml  
kubectl apply -f IstioControlPlaneMetrics.yaml -n $namespace 
kubectl apply -f IsitoDataPlaneMetrics.yaml   -n $namespace
