#!/bin/bash

commit="no message for this commit"
[[ "${1}" ]] && commit=${1}
hugo --gc --minify --verbose --verboseLog

function move_site_config(){
  cp ./public/sitemap.xml ./static/
  cp ./public/robots.txt ./static/
}
function remove_binario_icon(){
  rm apple-touch-icon.png
}

function public_deploy(){
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
  move_site_config;
  public_deploy;
  repo_deploy
}

function start(){
  move_site_config;
  deploy
}

start
