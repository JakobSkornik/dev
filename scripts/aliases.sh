#!/bin/bash
alias jupyter="$(readlink -e scripts/jupyter.sh)"
alias namenode="sensible-browser 172.27.1.5:50070"
alias streamsets="sensible-browser 172.27.1.17:18630"
alias sparkmaster="sensible-browser 172.27.1.10:8080"
alias hue="sensible-browser 172.27.1.13:8888"
alias kafkahq="sensible-browser 172.27.1.20:8080"
alias close="docker-compose down"
