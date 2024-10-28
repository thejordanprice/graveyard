import ipaddress
from scapy.all import *

def scan_network(ip_network):
    live_hosts = []
    for ip in ip_network.hosts():
        if arp_ping(ip):
            live_hosts.append(ip)
    return live_hosts

def arp_ping(ip):
    arp_request = Ether(dst="ff:ff:ff:ff:ff:ff") / ARP(pdst=str(ip))
    response = srp1(arp_request, timeout=1, verbose=0)
    if response:
        return True
    return False

def scan_ports(host):
    open_ports = []
    for port in range(1, 1025):  # Scan common ports
        response = sr1(IP(dst=str(host)) / TCP(dport=port, flags="S"), timeout=1, verbose=0)
        if response and response.haslayer(TCP) and response.getlayer(TCP).flags == 0x12:
            open_ports.append(port)
    return open_ports

def identify_services(host, ports):
    services = {}
    for port in ports:
        service = sr1(IP(dst=str(host)) / TCP(dport=port, flags="S"), timeout=1, verbose=0)
        if service and service.haslayer(TCP) and service.getlayer(TCP).flags == 0x12:
            services[port] = service.sprintf("%TCP.sport%")
    return services

if __name__ == "__main__":
    ip_network = input("Enter IP network (e.g., 192.168.1.0/24): ")
    network = ipaddress.ip_network(ip_network)
    
    live_hosts = scan_network(network)
    print("Live hosts:")
    for host in live_hosts:
        print(host)
    
    for host in live_hosts:
        print(f"\nScanning ports for {host}:")
        open_ports = scan_ports(host)
        if open_ports:
            print("Open ports:")
            print(open_ports)
            services = identify_services(host, open_ports)
            print("Identified services:")
            print(services)
        else:
            print("No open ports found.")
