#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='033[0m' #No colour

echo -e "${GREEN}Secure Chat - You can type your messages below - Started at $(date)${NC}"
echo -e "${BLUE}Press Ctrl + C to exit${NC}"
echo "-----------------------------------------------"

while true; do
	echo -ne "${GREEN}[$(date +%H:%M:%S)]${NC} Your message: "
	
	read message
	
	if [ -z "$mesage" ]; then
		continue
	fi
	
	timestamped_message="[$(date +%H:%M:%S)] $message: "
	
	echo -e "${BLUE}Encrypting and sending the message...${NC}"
	
	encrypted=$(echo "$timestamped_message" | openssl enc -aes-256-cbc -salt -base64 \
		-pbkdf2 -iter 10000 -pass pass:chatpassword 2>/dev/null)
		
	echo -e "${BLUE}Encrypted form:${NC} ${encrypted:0:50}..." #SHow first 50 characters
	echo "$encrypted" | nc -N localhost 12345
	
	echo -e "${GREEN}Message sent successfully!${NC}"
	echo "-------------------------------------------"

done