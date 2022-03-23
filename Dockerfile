# ベースとなる公式イメージ
FROM amazon/aws-glue-libs:glue_libs_1.0.0_image_01

# jupyterlabインストール
RUN pip install jupyterlab

#  起動スクリプト
COPY jupyter_start.sh /home/jupyter
RUN chmod 775 /home/jupyter/jupyter_start.sh

ENV PATH $PATH:/home/aws-glue-libs/bin/:/usr/share/maven/bin:${SPARK_HOME}/bin/
ENV PYTHONPATH $PYTHONPATH:/home/jupyter/jupyter_default_dir

# PySparkからjupyter labを起動するためのオプション設定
ENV PYSPARK_DRIVER_PYTHON jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS ' lab --allow-root --NotebookApp.token="" --NotebookApp.password="" --no-browser --ip=0.0.0.0'