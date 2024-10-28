# Cisco Configuration Parser

This Python script `parser.py` parses Cisco configuration files to extract and organize interface information into a JSON format.

## Requirements

This script requires Python 3.x. There are no additional dependencies beyond the Python standard library (`sys`, `re`, and `json`).

## Usage

1. **Clone the repository:**

```bash
git clone https://github.com/thejordanprice/cisco-config-parser.git
cd cisco-config-parser
```

2. **Run the script:**

Replace `sample.config` with your actual Cisco configuration file.

```bash
python3 parser.py sample.config
```

This will parse the Cisco configuration file and output the structured JSON representation.

## Example

Assume `sample.config` contains Cisco configuration lines for interfaces. Running `parser.py` on `sample.config` will output a JSON representation of the configuration.

```json
{
  "hostname": "retail",
  "interfaces": {
    "dialer 1": {
      "ip": "ips po max-events 100",
      "ppp": "authentication chap",
      "dialer": "pool 1",
      "dialer-group": "1",
      "dialer-list": "1 protocol ip permit",
      "network": "10.0.3.0 255.255.255.0",
      "default-router": "10.0.3.1",
      "no": "ftp-server write-enable",
      "bridge": "irb"
    },
    "FastEthernet3": {
      "switchport": "mode trunk",
      "no": "ip address"
    },
    "FastEthernet4": {
      "ip": "access-group 103 in",
      "no": "cdp enable",
      "speed": "auto",
      "crypto": "ipsec client ezvpn ezvpnclient",
      "encryption": "3des",
      "authentication": "pre-share",
      "group": "2 key secret-password",
      "lifetime": "480",
      "key": "secret-password",
      "dns": "10.50.10.1 10.60.10.1",
      "domain": "company.com",
      "pool": "dynpool",
      "set": "transform-set vpn1",
      "connect": "auto",
      "mode": "client",
      "peer": "192.168.100.1"
    },
    "Dot11Radio0": {
      "no": "ip address",
      "broadcast-key": "vlan 1 change 45",
      "encryption": "vlan 1 mode ciphers tkip",
      "ssid": "ciscowpa",
      "vlan": "3",
      "authentication": "open",
      "speed": "basic-1.0 basic-2.0 basic-5.5 6.0 9.0 basic-11.0 12.0 18.0 24.0 36.0 48.0 54.0",
      "rts": "threshold 2312",
      "power": "local ofdm 30",
      "channel": "2462",
      "station-role": "root"
    },
    "Vlan1": {
      "no": "cdp enable",
      "ip": "inspect firewall in",
      "crypto": "ipsec client ezvpn ezvpnclient inside",
      "bridge-group": "1 spanning-disabled"
    },
    "BVI1": {
      "ip": "address 10.0.1.1 255.255.255.0"
    }
  }
}
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.