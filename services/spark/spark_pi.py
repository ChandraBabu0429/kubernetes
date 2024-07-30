from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Spark Pi").getOrCreate()

def calc_pi(partitions):
    n = 100000 * partitions
    def f(_):
        x = random()
        y = random()
        return 1 if x*x + y*y < 1 else 0

    count = spark.sparkContext.parallelize(range(1, n + 1), partitions).map(f).reduce(lambda a, b: a + b)
    return 4.0 * count / n

partitions = 10
pi = calc_pi(partitions)
print(f"Pi is roughly {pi}")

spark.stop()
