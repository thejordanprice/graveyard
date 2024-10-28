# Netscan

This Python script allows you to scan a network for live hosts, open ports, and identify services running on those ports.

## Requirements

- Python 3.x
- scapy library (`pip install scapy`)

## Usage

1. Clone this repository to your local machine:

```
git clone https://github.com/thejordanprice/netscan.git
```

2. Navigate to the directory containing the `netscan.py` file:

```
cd netscan
```

3. Run the script:

```
python3 netscan.py
```

4. Enter the IP network in CIDR notation when prompted (e.g., `192.168.1.0/24`).

## Example

```bash
$ python3 netscan.py
Enter IP network (e.g., 192.168.1.0/24): 10.50.0.0/24

Live hosts:
10.50.0.1
10.50.0.2

Scanning ports for 10.50.0.1:
Open ports:
[22, 80]
Identified services:
{22: 'ssh', 80: 'http'}

Scanning ports for 10.50.0.2:
No open ports found.
```

## Notes

- Make sure you have appropriate permissions to run the script, especially for accessing network resources.
- This script uses ARP ping and TCP SYN scan techniques for network scanning, so it may require administrative privileges.
- Use this script responsibly and ensure you have proper authorization before scanning any network.
