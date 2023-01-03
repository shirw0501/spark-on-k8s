from pyspark.sql import SparkSession
from datetime import datetime
from pyspark.sql.functions import col, udf
from pyspark.sql.types import StringType

current_time = datetime.now().strftime("%Y%m%d_%H:%M:%S")
text_file = "/Users/shirleywong/Downloads/get-pip.py"
spark = (SparkSession.builder.appName("SparkSQLExampleApp").getOrCreate())

def convertCase(str):
    resStr=""
    arr = str.split(" ")
    for x in arr:
       resStr= resStr + x[0:1].upper() + x[1:len(x)] + " "
    return resStr
convertUDF = udf(lambda z: convertCase(z))


df = (spark.read.text(text_file))

df.select(convertUDF(col("value")).alias("Name")).show()

df.show()
# df.write.text('/Users/shirleywong/Documents/dev/test_output/output_{}.txt'.format(current_time))
