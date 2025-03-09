Node Exporter Installation Script

This script automates the installation and setup of Node Exporter on a Linux system. It downloads the latest version, sets up systemd for service management, and applies the correct permissions.

Prerequisites

1. A Linux-based system (Ubuntu, Debian, CentOS, etc.)
2. sudo privileges
3. Internet connection to download Node Exporter
4. git should be install

Features
1. Automatically downloads and extracts Node Exporter v1.7.0
2. Moves files to the correct location (/etc/node_exporter)
3. Configures a systemd service for automatic startup
4. Applies the correct file permissions
5. Verifies installation and checks the Node Exporter service status

Installation Steps

1️⃣ Download & Run the Script

$ git clone https://github.com/MMuzammil6880/install_node_exporter.git
$ sudo chmod +x install_node_exporter.sh
$ sudo ./install_node_exporter.sh

2️⃣ Verify Node Exporter Service

If everything is set up correctly, you should see:
✅ Node Exporter installation and setup completed successfully!

After installation, you can manually check the status using:
$ sudo systemctl status node_exporter

3️⃣ View Logs (if needed)

If the installation fails, the script will automatically display the last 10 logs for debugging:
$ sudo journalctl -u node_exporter --no-pager --lines=10

Uninstall Node Exporter
If you want to remove Node Exporter, run the following commands:

$ sudo systemctl stop node_exporter
$ sudo systemctl disable node_exporter
$ sudo rm -rf /etc/node_exporter
$ sudo rm /etc/systemd/system/node_exporter.service
$ sudo systemctl daemon-reload

Troubleshooting
If the service is not running, check logs:
$ sudo journalctl -u node_exporter --no-pager --lines=20

Ensure the service is enabled to start on reboot:
$ sudo systemctl enable node_exporter

If the binary is missing, rerun the script to reinstall Node Exporter.

Author
**Muhammad Muzammil**
