import pyspark

sc_conf = pyspark.SparkConf()
sc_conf.setAppName("pi-app")
sc_conf.setMaster('spark://spark-master-01:7077')
sc_conf.set('spark.executor.cores','1')
sc_conf.set("spark.executor.memory", '1g')

sc = pyspark.SparkContext(conf=sc_conf)

samples = sc.textFile("/bdpc/data/input/samples/sample.json")

print(samples.take(10))

