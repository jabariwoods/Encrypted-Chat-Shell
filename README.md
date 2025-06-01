# Encrypted-Chat-Shell
Overview

These two scripts implement a simple, encrypted chat system using Bash, OpenSSL, and netcat (nc):

secure_sender.sh: Sends encrypted messages.

secure_receiver.sh: Listens for and decrypts incoming messages.

Both scripts use AES-256-CBC encryption with a shared password (chatpassword) and communicate over TCP port 12345.

Usage Instructions

1. Prerequisites

Both scripts require openssl and nc (netcat) to be installed.

Both scripts must use the same password for encryption/decryption (chatpassword).

2. Start the Receiver

On the receiving machine (or terminal), run:

bash
bash secure_receiver.sh
This will listen on port 12345 for incoming encrypted messages.

3. Start the Sender

On the sending machine (or another terminal), run:

bash
bash secure_sender.sh
This will prompt you to type messages, which are then encrypted and sent to the receiver.

4. Sending and Receiving

Type your message in the sender terminal and press Enter.

The receiver will display the decrypted message.

Script Details
secure_sender.sh

Displays a prompt for the user to type a message.

Encrypts the message using OpenSSL with AES-256-CBC, base64 encoding, and PBKDF2 key derivation.

Sends the encrypted message via netcat to localhost:12345.

Shows a preview of the encrypted message.

secure_receiver.sh

Listens on TCP port 12345 for incoming connections.

Receives the encrypted message.

Decrypts the message using the same OpenSSL parameters and password.

Displays the decrypted message.

Notes and Issues
The scripts use hardcoded values for the password and port. For real-world use, consider making these configurable.

The sender assumes the receiver is running on localhost. To send to a remote host, change localhost to the receiver's IP address in secure_sender.sh.

There are minor typos in the scripts (e.g., mesage instead of message, messgaes instead of messages, Failes instead of Failed). These should be corrected for reliability.

The receiver script uses -nc as an OpenSSL flag, which is not a valid option and will cause decryption to fail. The correct flag should be -d for decryption.
