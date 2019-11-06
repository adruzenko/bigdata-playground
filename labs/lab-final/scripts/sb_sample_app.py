import pyspark
import random 

if __name__ == "__main__":
  sc_conf = pyspark.SparkConf()
  sc_conf.setAppName("pi-app")
  sc_conf.setMaster('spark://spark-master-01:7077')
  sc_conf.set('spark.executor.cores','1')
  sc_conf.set("spark.executor.memory", '1g')

  sc = pyspark.SparkContext(conf=sc_conf)

  num_samples = 1000000000

  def inside(p):     
    x, y = random.random(), random.random()
    return x*x + y*y < 1

  count = sc.parallelize(range(0, num_samples)).filter(inside).count()

  pi = 4 * count / num_samples
  print(pi)

  sc.stop()

