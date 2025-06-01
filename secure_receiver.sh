#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='033[0m' #No colour

echo -e "${GREEN}Secure Chat Reciever - Started at $(date)${NC}"
echo -e "${BLUE}Waiting for messgaes... Press Ctrl + C to exit${NC}"
echo "-----------------------------------------------"

while true; do
	
	echo -e "${BLUE} Waiting for message...${NC}"
	
	encrypted=$(nc -l 12345)
	
	if [ -z "$encrypted" ]; then
		continue
	fi
	
	echo -e "${YELLOW}Received encrypted message:${NC} ${encrypted:0:50}..."
	echo -e "${BLUE}Decrypting...${NC}"
	decrypted=$(echo "$encrypted" | openssl enc -nc -aes-256-cbc -salt -base64 \
		-pbkdf2 -iter 10000 -pass pass:chatpassword 2>/dev/null)
		
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}Decrypted message:${NC} $decrypted"
	else
		echo -e "\033[0;31mError: Failes to decrypt message${NC}"
	fi
	
	echo"--------------------------------------------------------"

done
	