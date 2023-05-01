#!/bin/bash

commit="no message for this commit"
[[ "${1}" ]] && commit=${1}
hugo --gc --minify --quiet

function public_deploy(){
  cd public
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
