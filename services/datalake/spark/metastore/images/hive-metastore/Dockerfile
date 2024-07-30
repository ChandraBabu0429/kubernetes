FROM ubuntu:20.04

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV HIVE_HOME=/opt/hive
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$HIVE_HOME/bin:$HADOOP_HOME/bin

# Install necessary packages
RUN apt-get update && apt-get install -y wget openjdk-11-jdk postgresql-client

# Download and setup Hive
RUN wget https://dlcdn.apache.org/hive/hive-3.1.3/apache-hive-3.1.3-bin.tar.gz \
    && tar -xzf apache-hive-3.1.3-bin.tar.gz -C /opt \
    && mv /opt/apache-hive-3.1.3-bin $HIVE_HOME \
    && rm apache-hive-3.1.3-bin.tar.gz

# Download and setup Hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz \
    && tar -xzf hadoop-3.3.6.tar.gz -C /opt \
    && mv /opt/hadoop-3.3.6 $HADOOP_HOME \
    && rm hadoop-3.3.6.tar.gz

# Delete existing JDBC jars in the Hive lib directory
RUN find $HIVE_HOME/lib -name 'postgresql-*.jar' -delete

# Download the latest PostgreSQL JDBC driver
RUN wget https://jdbc.postgresql.org/download/postgresql-42.7.3.jar -O $HIVE_HOME/lib/postgresql-jdbc.jar

# Set up classpath to include the jar files
ENV HADOOP_CLASSPATH=$HADOOP_HOME/share/hadoop/tools/lib/*

# Expose the Hive Metastore port
EXPOSE 9083

# Command to start the Hive Metastore service
CMD ["hive", "--service", "metastore"]