import socket
import os

def scan_tcp_port(host, port):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(1)
        s.connect((host, port))
        print(f"TCP Port {port} is open")
        s.close()
        return port
    except:
        print(f"TCP Port {port} is closed")

def scan_udp_port(host, port):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.settimeout(1)
        s.sendto(b'', (host, port))
        data, addr = s.recvfrom(1024)
        print(f"UDP Port {port} is open")
        s.close()
        return port
    except:
        print(f"UDP Port {port} is closed")

def scan_host_common_ports(host, scan_type):
    common_ports = [21, 22, 23, 25, 53, 80, 110, 143, 443, 465, 993, 995]
    open_ports = scan_host(host, common_ports, scan_type)
    save_scan_results(host, scan_type, open_ports)

def scan_host_custom_ports(host, ports, scan_type):
    open_ports = scan_host(host, ports, scan_type)
    save_scan_results(host, scan_type, open_ports)

def scan_host(host, ports, scan_type):
    print(f"Scanning host {host}...")
    open_ports = []
    if scan_type == "tcp":
        for port in ports:
            result = scan_tcp_port(host, port)
            if result:
                open_ports.append(result)
    elif scan_type == "udp":
        for port in ports:
            result = scan_udp_port(host, port)
            if result:
                open_ports.append(result)
    elif scan_type == "both":
        for port in ports:
            result_tcp = scan_tcp_port(host, port)
            result_udp = scan_udp_port(host, port)
            if result_tcp or result_udp:
                open_ports.append(port)
    else:
        print("Invalid scan type")
    return open_ports

def save_scan_results(host, scan_type, open_ports):
    file_name = f"results/{host}.{scan_type}.ports.txt"
    with open(file_name, 'w') as f:
        for port in open_ports:
            f.write(f"{port}\n")
    print(f"Scan results saved to {file_name}")

def main():
    host = input("Enter the target host IP address: ")
    choice = input("Choose scanning type (1 for common ports, 2 for custom ports): ")
    scan_type = input("Choose scan type (tcp, udp, or both): ").lower()
    
    if choice == "1":
        scan_host_common_ports(host, scan_type)
    elif choice == "2":
        ports = [int(port) for port in input("Enter the ports to scan (comma-separated): ").split(",")]
        scan_host_custom_ports(host, ports, scan_type)
    else:
        print("Invalid choice")

if __name__ == "__main__":
    main()
