from pyspark.sql import SparkSession
import random

def inside(p):
    x, y = random.random(), random.random()
    return x*x + y*y < 1

if __name__ == "__main__":
    spark = SparkSession.builder.appName("Spark Pi").getOrCreate()
    sc = spark.sparkContext

    NUM_SAMPLES = 1000  # Smaller number of samples
    count = sc.parallelize(range(0, NUM_SAMPLES)).filter(inside).count()
    pi = 4.0 * count / NUM_SAMPLES
    print("Pi is roughly %f" % pi)

    spark.stop()
