#!/bin/bash


for i in {1..10}
do
  sleep 60
  kubectl  apply -f frontend.yaml -n frontend

  sleep 60
  kubectl  delete  -f frontend.yaml -n frontend
done


