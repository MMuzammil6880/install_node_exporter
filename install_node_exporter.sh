#!/bin/bash


# Define Variables

DOWNLOAD_URL="wget  https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz"
VERSION="1.7.0"
INSTALL_DIR="/etc/node_exporter"
SERVICE_FILE="/etc/systemd/system/node_exporter.service"


# Downloading the NODE EXPORTER

echo "Downloading Node Exporter v$VERSION..."

sudo wget -q $DOWNLOAD_URL -O /tmp/node_exporter.tar.gz


# Extract the files
echo "Extracting Node Exporter..."
sudo tar xzf /tmp/node_exporter.tar.gz -C /tmp/

# Move Node Exporter to /etc/node_exporter
echo "Moving the Node Exporter to + $INSTALL_DIR..."
sudo mv /tmp/node_exporter-$VERSION.linux-amd64 $INSTALL_DIR

# Create Systemd Service File
echo "Creating Node Exporter systemd service..."
sudo bash -c "cat > $SERVICE_FILE" <<EOF
[Unit]
Description=Node Exporter
After=network.target

[Service]
ExecStart=/usr/bin/env $INSTALL_DIR/node_exporter
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

# Set Permissions
echo "Setting permissions for Node Exporter..."

sudo chmod +x $INSTALL_DIR/node_exporter
sudo chown root:root $INSTALL_DIR/node_exporter
sudo chmod 755 $INSTALL_DIR/node_exporter

# Reload Systemd and Enable Service
echo "Reloading systemd and enabling Node Exporter..."

sudo systemctl daemon-reload
sudo systemctl enable node_exporter

# Start Node Exporter
echo "Starting Node Exporter..."

sudo systemctl restart node_exporter

# Check Node Exporter Status
echo "Checking Node Exporter status..."

STATUS=$(sudo systemctl is-active node_exporter)

if [ "$STATUS" == "active" ]; then
    echo "✅ Node Exporter installation and setup completed successfully!"
else
    echo "❌ Node Exporter failed to start. Showing error logs:"
    sudo journalctl -u node_exporter --no-pager --lines=10
fi
