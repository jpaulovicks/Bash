#!/usr/bin/env bash

OK='\033[0;32m'
INFO='\033[0;36m'
WARN='\033[0;33m'
ERROR='\033[0;31m'
SYSCHK='\033[0;35m'
NC='\033[0m'

clear

if [[ $EUID != 0 ]]; then
  echo -e "${ERROR}[ ! ]${NC} Please execute script as ${ERROR}root${NC}"
  sleep 2s
fi

## PLACE FUNCTIONS HERE

echo -e "${INFO}--------------------------------------------------------------------------------------------------${NC}"
echo -e "${INFO}\t\t\t\t ### SCRIPT TITLE/HEADER HERE ###${NC}"
echo -e "${INFO}--------------------------------------------------------------------------------------------------${NC}"
echo -e "${ERROR}This script will perform the following fucntions${NC}"
sleep 1s
while true; do
  read -r -p "Do you wish to continue?[y/n] " answer
  case ${answer:0:1} in
    [Yy]* )
      # Change this to your main function name
      main;;
    [Nn]* )
      exit;;
    * ) echo -e "${WARN}Unknown selection${NC}"
  esac
done