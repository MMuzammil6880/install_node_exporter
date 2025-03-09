Node Exporter Installation Script

This script automates the installation and setup of Node Exporter on a Linux system. It downloads the latest version, sets up systemd for service management, and ensures the correct permissions are applied.

Prerequisites

A Linux-based system (Ubuntu, Debian, CentOS, etc.)
sudo privileges
Internet connection to download Node Exporter
Features

Automatically downloads and extracts Node Exporter v1.7.0
Moves files to the correct location (/etc/node_exporter)
Configures a systemd service for automatic startup
Applies the correct file permissions
Verifies installation and checks the Node Exporter service status

Installation Steps

1️⃣ Download & Run the Script

git clone url
sudo chmod +x install_node_exporter.sh
sudo ./install_node_exporter.sh

2️⃣ Verify Node Exporter Service

After installation, you can manually check the status using:
sudo systemctl status node_exporter

If everything is set up correctly, you should see:

✅ Node Exporter installation and setup completed successfully!

3️⃣ View Logs (if needed)

If the installation fails, the script will automatically display the last 10 logs for debugging:
sudo journalctl -u node_exporter --no-pager --lines=10

Uninstall Node Exporter

If you want to remove Node Exporter, run the following commands:

sudo systemctl stop node_exporter
sudo systemctl disable node_exporter
sudo rm -rf /etc/node_exporter
sudo rm /etc/systemd/system/node_exporter.service
sudo systemctl daemon-reload

Troubleshooting

If the service is not running, check logs:

sudo journalctl -u node_exporter --no-pager --lines=20

Ensure the service is enabled to start on reboot:

sudo systemctl enable node_exporter

If the binary is missing, rerun the script to reinstall Node Exporter.

Author

Muhammad Muzammil
