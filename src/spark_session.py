from pyspark.context import SparkContext
from awsglue.context import GlueContext
from pyspark.sql import (
    SparkSession,
)
import os

def create_spark_session() -> SparkSession:
    os.environ['PYSPARK_SUBMIT_ARGS'] = 'pyspark-shell'

    glueContext = GlueContext(SparkContext.getOrCreate())
    spark_session = glueContext.spark_session
    return spark_session
