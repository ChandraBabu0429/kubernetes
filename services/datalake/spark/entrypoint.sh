# Save this as entrypoint.sh
#!/bin/bash

# Unset problematic environment variables
unset SPARK_MASTER_PORT_7077_TCP
unset SPARK_MASTER_PORT

# Set the correct SPARK_MASTER_URL
export SPARK_MASTER_URL="spark://spark-master:7077"

# Start the Spark worker
/opt/bitnami/spark/bin/spark-class org.apache.spark.deploy.worker.Worker $SPARK_MASTER_URL
