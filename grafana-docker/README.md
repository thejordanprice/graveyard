# Grafana Docker Setup

This repository contains Docker configurations to set up Node Exporter, Prometheus, and Grafana for monitoring and visualization.

## Features

- **Node Exporter**: A Prometheus exporter for hardware and OS metrics.
- **Prometheus**: A monitoring system and time series database.
- **Grafana**: A powerful monitoring and analytics platform.

## Getting Started

### Prerequisites

- Docker installed on your system.
- Portainer installed on your system.

### Installation

1. Clone the repository:
   git clone https://github.com/thejordanprice/grafana-docker.git
   cd grafana-docker

2. Move the Prometheus configuration file:
   mv ./prometheus/prometheus.yml /prometheus/prometheus.yml

3. Open Portainer and navigate to **Stacks**.

4. Click **Add stack**.

5. Name your stack and paste the contents of `docker-compose.yml` from this repository into the **Web editor**.

6. Deploy the stack.

### Configuration

- `node_exporter.yaml`: Configuration for Node Exporter.
- `prometheus.yaml`: Configuration for Prometheus.
- `grafana.yaml`: Configuration for Grafana.

### Accessing Grafana

1. Open your browser and navigate to `http://localhost:3000`.
2. Log in with the default credentials:
   - **Username**: `admin`
   - **Password**: `admin`

## Contributing

Feel free to open issues or submit pull requests for improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
