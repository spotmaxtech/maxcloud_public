#!/usr/bin/env bash

function download() {
  public_dir=/tmp/maxcloud_public
  if [ -d "$public_dir" ]; then
    cd $public_dir && git pull
  else
    git clone https://github.com/spotmaxtech/maxcloud_public.git $public_dir
  fi
}

download

grafana_dir=$public_dir/setup/grafana_dir

#配置grafana数据源  [请参照正确的prometheus svc地址]
kubectl apply -f $grafana_dir/grafana-datasource.yaml

#安装
kubectl apply -f $grafana_dir/grafana.yaml
kubectl apply -f $grafana_dir/grafana-proxy.yaml


