FROM bitnami/spark:latest

# Add the custom entrypoint script
COPY entrypoint.sh /opt/bitnami/scripts/spark/entrypoint.sh

# Make the script executable
RUN chmod +x /opt/bitnami/scripts/spark/entrypoint.sh

# Set the custom entrypoint
ENTRYPOINT ["/opt/bitnami/scripts/spark/entrypoint.sh"]
