#!/bin/bash

commit="no message for this commit"
[[ "${1}" ]] && commit=${1}
hugo --gc --minify --verbose --verboseLog

function remove_binario_icon(){
  rm apple-touch-icon.png
}

function public_deploy(){
  cp ./static/robots.txt ./public/robots.txt
  cd public
  remove_binario_icon
  git add .
  git commit -m "${commit}"
  git push origin main
}

function repo_deploy(){
  cd ..
  git add .
  git commit -m "$commit"
  git push origin main
}

function deploy(){
  public_deploy;
  repo_deploy
}

function start(){
  deploy
}

start
