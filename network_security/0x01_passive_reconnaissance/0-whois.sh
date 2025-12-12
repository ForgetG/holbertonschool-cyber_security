#!/bin/bash
whois $1 | awk -F': ' '/^Registration |^Admin |^Tech |^Registrant / {print $1 "," $2}' > "$1.csv"
