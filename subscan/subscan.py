import dns.resolver

def get_dns_records(domain):
    records = {}
    record_types = ['A', 'AAAA', 'CNAME', 'MX', 'NS', 'TXT', 'SRV', 'PTR', 'SOA', 'CAA']
    for record_type in record_types:
        try:
            answers = dns.resolver.resolve(domain, record_type)
            records[record_type] = [str(rdata) for rdata in answers]
        except dns.resolver.NoAnswer:
            pass
        except dns.resolver.NXDOMAIN:
            pass
    return records

def save_dns_records_to_file(domain, records):
    filename = f"results/{domain}.dns.txt"
    with open(filename, 'w') as f:
        for record_type, values in records.items():
            f.write(f"{record_type} Records:\n")
            for value in values:
                f.write(f"\t{value}\n")
            f.write('\n')
    print(f"DNS records saved to {filename}")

if __name__ == "__main__":
    domain = input("Enter the top-level domain (e.g., example.com): ")
    records = get_dns_records(domain)
    save_dns_records_to_file(domain, records)