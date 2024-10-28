# Subscan

Subscan is a lightweight Python tool for scanning and discovering subdomains within a given top-level domain (TLD). Utilizing DNS resolution, Subscan swiftly identifies subdomains associated with a specified domain, offering a simple yet effective solution for reconnaissance and security assessments.

## Features

- Quickly scan and identify subdomains for a given top-level domain.
- Supports various DNS record types including A, AAAA, CNAME, MX, NS, TXT, SRV, PTR, SOA, and CAA.
- Saves scan results to a text file for further analysis.

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/thejordanprice/subscan.git
    ```

2. Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

3. Run the script:

    ```bash
    python subscan.py
    ```

4. Follow the prompts to enter the top-level domain you want to scan.

5. Once the scan is complete, the results will be saved to a text file named `[topleveldomain].dns.txt`.

## Requirements

- Python 3.x
- dnspython

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
