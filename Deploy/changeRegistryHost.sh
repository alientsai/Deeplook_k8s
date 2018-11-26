#!/bin/bash
# For changing yaml's registry host
# Kevin(5f) A40503 - 2018.11 

IP=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')
ORG=140.96.29.86
ary=$(find ./ -iname "*-from-registry.*" -exec echo {} \;)
echo "Change $ORG to $IP :"
for file in $ary; do
  sed -i "s|$ORG|$IP|g" $file
  echo "$file Changed."
done