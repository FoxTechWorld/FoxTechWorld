#!/bin/bash

commit="no message for this commit"
[[ "${1}" ]] && commit=${1}
hugo --gc --minify --verbose --verboseLog

function move_site_config(){
  cp ./static/robots.txt ./public/robots.txt
  cp ./public/robots.txt ./static/robots.txt
  cp ./public/sitemap.xml ./static/sitemap.xml
  cp ./static/sitemap.xml ./public/sitemap.xml
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
