#!/bin/bash

git submodule update --init --recursive

target_image_repo=${1}
target_image_tag=$(./get-lxconsole-tag.sh)

target_image=${target_image_repo}:${target_image_tag}
docker build -t ${target_image} .

echo ${target_image} > .lxconsole_target_image
