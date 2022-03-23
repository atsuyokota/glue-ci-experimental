import pytest
import pyspark
import pandas as pd
from src.spark_session import create_spark_session

def test_prototype():
    pdf = pd.DataFrame({'item_id': [1,2,3,4,5],
                        'price': [100,200,300,400,500]})
    spark_session = create_spark_session()
    sdf = spark_session.createDataFrame(pdf)
    assert sdf.count() == 5